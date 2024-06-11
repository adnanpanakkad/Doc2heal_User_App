import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doc2heal/razorpay.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/booking/booking_button.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/button.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final Map<String, dynamic>? doctorData;
  final String? userId;

  const BookingScreen({
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage('assets/Ellipse 1.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        'Dr. ${doctorData!['name']}',
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
              const SizedBox(height: 20),
              const Text(
                'Availability',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomTextfield(
                hintText: 'pick your date',
                controller: null,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 19,
                  children: [
                    _buildTimeSlot('09:00 AM'),
                    _buildTimeSlot('10:00 AM'),
                    _buildTimeSlot('11:00 AM'),
                    _buildTimeSlot('01:00 PM'),
                    _buildTimeSlot('02:00 PM', isSelected: true),
                    _buildTimeSlot('03:00 PM', isSelected: false),
                    _buildTimeSlot('04:00 PM'),
                    _buildTimeSlot('07:00 PM'),
                    _buildTimeSlot('08:00 PM'),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reason',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const CustomTextfield(
                hintText: 'pick your date',
                controller: null,
              ),
              BookingButton(
                  text: 'book apoinment',
                  onTap: () {
                    String amount = doctorData!['fees'];
                    RazorPay razorPayInstance = RazorPay();
                    razorPayInstance.razorPay(context, amount.toString());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateColumn('Mon', '21'),
        _buildDateColumn('Tue', '22'),
        _buildDateColumn('Wed', '23', isSelected: true),
        _buildDateColumn('Thu', '24'),
        _buildDateColumn('Fri', '25'),
        _buildDateColumn('Sat', '26'),
      ],
    );
  }

  Widget _buildDateColumn(String day, String date, {bool isSelected = false}) {
    return Column(
      children: [
        Text(day,
            style: TextStyle(
                color: isSelected ? Appcolor.primaryColor : Colors.black)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? Appcolor.primaryColor : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time, {bool isSelected = false}) {
    return Container(
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
    );
  }
}
