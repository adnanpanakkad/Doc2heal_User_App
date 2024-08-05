import 'package:doc2heal/model/appoinment_model.dart';
import 'package:doc2heal/model/doctor_model.dart';
import 'package:doc2heal/presentation/view/chat_screen.dart';
import 'package:doc2heal/services/firebase/firebase_appoinment.dart';
import 'package:doc2heal/services/firebase/firebase_chat.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:doc2heal/widgets/chat/shimmer_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/utils/app_text_styles.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late Future<List<AppointmentModel>> _appointmentsFuture;
  final ChatRepository _chatRepository = ChatRepository();

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  void _fetchAppointments() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _appointmentsFuture =
          AppoinmentServices().getUpcomingAppointments(user.uid);
    } else {
      _appointmentsFuture = Future.value([]);
    }
  }

  Stream<String> _getLastMessageStream(String doctorId) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return _chatRepository
        .getLastMessageStream(userId, doctorId)
        .map((lastMessage) => lastMessage?.message ?? '');
  }

  Future<DoctorsModel?> _fetchDoctor(String docId) async {
    return UserRepository().getDoctorById(docId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Messages',
                style: CustomTextStyle.highboldTxtStyle,
              ),
              Expanded(
                child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, authSnapshot) {
                    if (authSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const ShimmerList();
                    } else if (authSnapshot.hasError) {
                      return Center(
                        child: Text('Error: ${authSnapshot.error}'),
                      );
                    } else if (!authSnapshot.hasData) {
                      return const Center(
                        child: Text('User not logged in'),
                      );
                    } else {
                      return FutureBuilder<List<AppointmentModel>>(
                        future: _appointmentsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const ShimmerList();
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text('Error loading appointments'),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No appointments found'));
                          } else {
                            final appointments = snapshot.data!;
                            return ListView.builder(
                              itemCount: appointments.length,
                              itemBuilder: (context, index) {
                                final appointment = appointments[index];
                                return FutureBuilder<DoctorsModel?>(
                                  future: _fetchDoctor(appointment.docid!),
                                  builder: (context, doctorSnapshot) {
                                    if (doctorSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const ShimmerList();
                                    } else if (doctorSnapshot.hasError) {
                                      return const Center(
                                        child:
                                            Text('Error loading doctor data'),
                                      );
                                    } else if (!doctorSnapshot.hasData) {
                                      return const Center(
                                          child: Text('Doctor not found'));
                                    } else {
                                      final doctor = doctorSnapshot.data!;
                                      return StreamBuilder<String>(
                                        stream:
                                            _getLastMessageStream(doctor.uid!),
                                        builder: (context, messageSnapshot) {
                                          if (messageSnapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const ShimmerList();
                                          } else if (messageSnapshot.hasError) {
                                            return const Center(
                                              child:
                                                  Text('Error loading message'),
                                            );
                                          } else {
                                            final lastMessage =
                                                messageSnapshot.data ??
                                                    'No messages';
                                            return ListTile(
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              leading: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    doctor.doctorimg ?? ''),
                                              ),
                                              title: Text(
                                                  'Dr.${doctor.name![0].toUpperCase()}${doctor.name!.substring(1)}'),
                                              subtitle: Text(
                                                lastMessage,
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatScreen(
                                                      reciverEmail:
                                                          'Dr.${doctor.name![0].toUpperCase()}${doctor.name!.substring(1)}',
                                                      reciverID: doctor.uid!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
