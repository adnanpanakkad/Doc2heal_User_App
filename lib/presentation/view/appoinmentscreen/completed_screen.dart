import 'package:doc2heal/model/appoinment_model.dart';
import 'package:doc2heal/model/doctor_model.dart';
import 'package:doc2heal/presentation/view/booking_screen.dart';
import 'package:doc2heal/services/firebase/firebase_appoinment.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:doc2heal/widgets/schedule/completeschedule_card.dart';
import 'package:doc2heal/widgets/schedule/shimmer_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  late Future<List<AppointmentModel>> _appointmentsFuture;

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  void _fetchAppointments() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _appointmentsFuture =
          AppoinmentServices().getExpiredAppointments(user.uid);
    } else {
      _appointmentsFuture = Future.value([]);
    }
  }

  Future<DoctorsModel?> _fetchDoctor(String docid) async {
    return UserRepository().getDoctorById(docid);
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
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<AppointmentModel>>(
                  future: _appointmentsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerCard();
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('No completed appointments'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No appointments'));
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
                                return const ShimmerCard();
                              } else if (doctorSnapshot.hasError) {
                                return const Center(
                                    child: Text('Error loading doctor data'));
                              } else if (!doctorSnapshot.hasData) {
                                return const Center(
                                    child: Text('Doctor not found'));
                              } else {
                                final doctor = doctorSnapshot.data!;
                                return CompletescheduleCard(
                                  selected: true,
                                  id: appointment.id,
                                  docName: doctor.name,
                                  docimgurl: doctor.doctorimg,
                                  specialization: doctor.specialization,
                                  time: appointment.time,
                                  date: appointment.date,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => BookingScreen(
                                                doctorData: doctor.toMap(),
                                                userId: '')));
                                  },
                                );
                              }
                            },
                          );
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
