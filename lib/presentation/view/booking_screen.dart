import 'package:doc2heal/model/schedule_model.dart';
import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/razorpay.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/booking/booking_button.dart';
import 'package:doc2heal/widgets/booking/date_time.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class BookingScreen extends StatelessWidget {
  GlobalKey<FormState> scheduleformkey = GlobalKey<FormState>();
  final DatePickerFun datePickerFun = DatePickerFun();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final Map<String, dynamic>? doctorData;
  final String? userId;
  String? selectedTimeSlot;

  BookingScreen({
    super.key,
    required this.doctorData,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: doctorData != null &&
                                doctorData!['doctorimg'] != null
                            ? NetworkImage(doctorData!['doctorimg'])
                            : AssetImage('assets/Ellipse 1.png')
                                as ImageProvider,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. ${doctorData!['name'][0].toUpperCase() + doctorData!['name'].substring(1)}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // Text(doctorData!['starttime']),
                  const SizedBox(height: 20),
                  const Text(
                    'Availability',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is DatePickedState) {
                        dateController.text = state.pickedDate;
                      }
                      return CustomTextfield(
                        validation: (value) =>
                            Validator().textFeildValidation(value),
                        hintText: 'Pick your date',
                        controller: dateController,
                        suffixIcon: IconButton(
                            onPressed: () {
                              datePickerFun.getTimeFromUser(context);
                            },
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.red,
                            )),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      String? selectedTimeSlot;
                      if (state is TimeSlotSelectedState) {
                        selectedTimeSlot = state.selectedTimeSlot;
                      }
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        childAspectRatio: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 19,
                        children: [
                          _buildTimeSlot('09:00 AM', selectedTimeSlot),
                          _buildTimeSlot('10:00 AM', selectedTimeSlot),
                          _buildTimeSlot('11:00 AM', selectedTimeSlot),
                          _buildTimeSlot('01:00 PM', selectedTimeSlot),
                          _buildTimeSlot('02:00 PM', selectedTimeSlot),
                          _buildTimeSlot('03:00 PM', selectedTimeSlot),
                          _buildTimeSlot('04:00 PM', selectedTimeSlot),
                          _buildTimeSlot('07:00 PM', selectedTimeSlot),
                          _buildTimeSlot('08:00 PM', selectedTimeSlot),
                        ],
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
                  BookingButton(
                    text: 'Book appointment',
                    onTap: () async {
                      if (scheduleformkey.currentState!.validate()) {
                        final schedule = ScheduleModel(
                            docImg: doctorData!['docImg'],
                            name: doctorData!['name'],
                            specialization: doctorData!['specialization'],
                            date: dateController.text,
                            time: selectedTimeSlot!,
                            reason: reasonController.text);
                        UserRepository()
                            .setAppoinment(schedule, doctorData!['id']);
                      }
                      String amount = doctorData!['fees'];
                      RazorPay razorPayInstance = RazorPay();
                      razorPayInstance.razorPay(context, amount.toString());
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

  Widget _buildTimeSlot(String time, String? selectedTimeSlot) {
    final isSelected = time == selectedTimeSlot;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            context
                .read<ProfileBloc>()
                .add(TimeSlotSelectedEvent(timeSlot: time));
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Appcolor.primaryColor : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
