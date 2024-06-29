import 'package:doc2heal/services/firebase/firebase_appoinment.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:doc2heal/model/appoinment_model.dart';
import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/razorpay.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/booking/booking_button.dart';
import 'package:doc2heal/widgets/booking/date_time.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:doc2heal/widgets/common/validator.dart';

class BookingScreen extends StatelessWidget {
  final pickedDate = DateTime.now();
  final Map<String, dynamic>? doctorData;
  final user = FirebaseAuth.instance.currentUser;
  final String? userId;
  final GlobalKey<FormState> scheduleformkey = GlobalKey<FormState>();
  final DatePickerFun datePickerFun = DatePickerFun();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  String? selectedTimeSlot;

  BookingScreen({
    Key? key,
    required this.doctorData,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.lightbackground,
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 70),
          child: DeatialAppbar(
            text: 'Doctor Details',
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: scheduleformkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Card(
                        elevation: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            doctorData != null &&
                                    doctorData!['doctorimg'] != null
                                ? doctorData!['doctorimg']
                                : 'assets/Ellipse 1.png',
                            height: 150,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. ${doctorData!['name'][0].toUpperCase() + doctorData!['name'].substring(1)}',
                            style: CustomTextStyle.buttonTextStyle,
                          ),
                          Text(
                            doctorData!['specialization'],
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'About',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Date',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  BlocListener<ProfileBloc, ProfileState>(
                    listener: (context, state) {
                      if (state is DatePickedState) {
                        dateController.text = state.pickedDate;
                      }
                    },
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        return CustomTextfield(
                          readOnly: true,
                          validation: (value) =>
                              Validator().textFeildValidation(value),
                          hintText:
                              'pick your date', // Use DateTime.now() for hint text
                          controller: dateController,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final pickedDate =
                                  await datePickerFun.getTimeFromUser(context);
                              if (pickedDate != null) {
                                context.read<ProfileBloc>().add(
                                    DatePickedEvent(pickedDate: pickedDate));
                              }
                            },
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Text(
                    'Time',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (doctorData == null ||
                          doctorData!['starttime'] == null ||
                          doctorData!['endtime'] == null) {
                        return const Text('No available time slots.');
                      }
                      // Generate time slots from start time to end time
                      final timeSlots = _generateTimeSlots(
                        doctorData!['starttime'],
                        doctorData!['endtime'],
                      );
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        childAspectRatio: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 19,
                        children: timeSlots
                            .map((time) => _buildTimeSlot(context, time))
                            .toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Reason',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextfield(
                    validation: (value) =>
                        Validator().textFeildValidation(value),
                    hintText: 'Reason',
                    controller: reasonController,
                  ),
                  const SizedBox(height: 20),
                  BookingButton(
                    text: 'Book appointment',
                    onTap: () async {
                      if (scheduleformkey.currentState!.validate()) {
                        try {
                          String amount = doctorData!['fees'];
                          RazorPay razorPayInstance = RazorPay();
                          razorPayInstance.razorPay(
                            context,
                            amount.toString(),
                          );

                          final apoinment = AppointmentModel(
                            uid: user!.uid,
                            docid: doctorData!['uid'],
                            date: dateController.text,
                            time: selectedTimeSlot!,
                            reason: reasonController.text,
                          );

                          await AppoinmentServices().addAppointment(apoinment);
                          print('Appointment saved successfully');

                          dateController.clear();
                          reasonController.clear();
                        } catch (e) {
                          print('Error during booking: $e');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(BuildContext context, String time) {
    final ProfileBloc profileBloc = context.read<ProfileBloc>();

    return GestureDetector(
      onTap: () {
        profileBloc.add(TimeSlotSelectedEvent(timeSlot: time));
        selectedTimeSlot = time; // Set the selected time slot
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final isSelected =
              state is TimeSlotSelectedState && state.selectedTimeSlot == time;

          return Container(
            decoration: BoxDecoration(
              color: isSelected ? Appcolor.primaryColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<String> _generateTimeSlots(String startTime, String endTime) {
    List<String> timeSlots = [];

    try {
      DateTime start = _parseTime(startTime);
      DateTime end = _parseTime(endTime);

      while (start.isBefore(end)) {
        timeSlots.add(_formatTime(start));
        start = start.add(const Duration(minutes: 30));
      }
    } catch (e) {
      debugPrint('Error generating time slots: $e');
    }

    return timeSlots;
  }

  DateTime _parseTime(String time) {
    final trimmedTime = time.trim();
    final components = trimmedTime.split(' ');
    final hourMinute = components[0].split(':');
    final hour = int.tryParse(hourMinute[0]);
    final minute = int.tryParse(hourMinute[1]);
    final isPM = components[1].toUpperCase() == 'PM';
    if (hour != null && minute != null) {
      final dateTime = DateTime(1, 1, 1, isPM ? hour + 12 : hour, minute);
      return dateTime;
    }
    throw const FormatException('Invalid time format');
  }

  String _formatTime(DateTime time) {
    final format = DateFormat.jm();
    return format.format(time);
  }
}
