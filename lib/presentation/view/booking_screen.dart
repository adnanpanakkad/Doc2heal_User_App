import 'package:doc2heal/services/firebase/firebase_appoinment.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:doc2heal/widgets/common/custom_snacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:doc2heal/model/appoinment_model.dart';
import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/razorpay.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/booking/booking_button.dart';
import 'package:doc2heal/widgets/booking/date_picker.dart';
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
  AppoinmentServices appoinmentServices = AppoinmentServices();

  BookingScreen({
    super.key,
    required this.doctorData,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.lightbackground,
        appBar: DeatialAppbar(
          text: 'Doctor Details',
          onTap: () => Navigator.pop(context),
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
                  Text(
                    "Dr. ${doctorData!['name']} is a highly skilled in ${doctorData!['specialization']}. With a deep commitment to patient care, utilizes the latest advancements in ${doctorData!['specialization']}. Dedicated to helping patients achieve and improve their overall quality of life.",
                    style: const TextStyle(
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
                          hintText: 'pick your date',
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
                              color: Appcolor.primaryColor,
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
                      final timeSlots = _generateTimeSlots(
                        doctorData!['starttime'],
                        doctorData!['endtime'],
                      );
                      return FutureBuilder<List<AppointmentModel>>(
                        future: appoinmentServices.getAppointmentsByDoctorId(
                          doctorData!['uid'],
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.green));
                          }

                          if (snapshot.hasError) {
                            return const Text('Error loading appointments.');
                          }

                          final appointments = snapshot.data ?? [];

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 19,
                            ),
                            itemCount: timeSlots.length,
                            itemBuilder: (context, index) {
                              final time = timeSlots[index];
                              return _buildTimeSlot(
                                context,
                                time,
                                appointments,
                              );
                            },
                          );
                        },
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

  Widget _buildTimeSlot(
      BuildContext context, String time, List<AppointmentModel> appointments) {
    final ProfileBloc profileBloc = context.read<ProfileBloc>();

    final isBooked = _isTimeSlotBooked(time, appointments, dateController.text);
    final isPast = _isTimeSlotPast(time);

    return GestureDetector(
      onTap: () {
        if (isBooked) {
          CustomSnackbar.show(
              context,
              'This time slot is already booked. Please select another slot',
              Colors.red);
        } else if (isPast) {
          CustomSnackbar.show(context,
              'This slot is Expired.Please select another slot', Colors.red);
        } else {
          profileBloc.add(TimeSlotSelectedEvent(timeSlot: time));
          selectedTimeSlot = time; // Set the selected time slot
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final isSelected =
              state is TimeSlotSelectedState && state.selectedTimeSlot == time;
          return Container(
            decoration: BoxDecoration(
              color: isBooked
                  ? Colors.red.shade200
                  : isPast
                      ? Colors.green.shade50 // Yellow for past times
                      : isSelected
                          ? Appcolor.primaryColor
                          : Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  color: isBooked
                      ? Colors.white
                      : isPast
                          ? Colors.black // Black text for yellow background
                          : isSelected
                              ? Colors.white
                              : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isTimeSlotBooked(
      String time, List<AppointmentModel> appointments, String? selectedDate) {
    return appointments.any((appointment) =>
        appointment.time == time &&
        appointment.date == selectedDate &&
        (appointment.status == null || appointment.status != true));
  }

  bool _isTimeSlotPast(String time) {
    try {
      DateTime slotTime = _parseTime(time);
      DateTime now = DateTime.now();

      // Extract the selected date from the dateController
      String selectedDateText = dateController.text;

      // Debugging: Print the selected date text
      debugPrint('Selected date text: $selectedDateText');

      // Check if selectedDateText is not empty
      if (selectedDateText.isEmpty) {
        debugPrint('Selected date text is empty');
        return false;
      }

      // Adjust the format based on actual data
      DateTime selectedDate = DateFormat('M/d/yyyy').parse(selectedDateText);

      // Create a DateTime for the slot within the current day
      DateTime fullSlotTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        slotTime.hour,
        slotTime.minute,
      );

      // Check if the slot time is before the current time
      return fullSlotTime.isBefore(now);
    } catch (e) {
      debugPrint('Error checking if time slot is past: $e');
      return false;
    }
  }

  List<String> _generateTimeSlots(String? startTime, String? endTime) {
    List<String> timeSlots = [];

    try {
      DateTime start = _parseTime(startTime!);
      DateTime end = _parseTime(endTime!);

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
    final trimmedTime = time.replaceAll('\u202F', ' ').trim();
    final components = trimmedTime.split(' ');
    if (components.length != 2) {
      throw FormatException('Invalid time format: $time');
    }
    final hourMinute = components[0].split(':');
    if (hourMinute.length != 2) {
      throw FormatException('Invalid time format: $time');
    }
    final hour = int.tryParse(hourMinute[0]);
    final minute = int.tryParse(hourMinute[1]);
    final isPM = components[1].toUpperCase() == 'PM';
    if (hour != null && minute != null) {
      final dateTime =
          DateTime(1, 1, 1, isPM ? (hour % 12) + 12 : hour % 12, minute);
      return dateTime;
    }
    throw FormatException('Invalid time format: $time');
  }

  String _formatTime(DateTime time) {
    final format = DateFormat.jm();
    return format.format(time);
  }
}
