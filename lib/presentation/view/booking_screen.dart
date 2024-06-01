import 'package:doc2heal/presentation/view/razorpay.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 70),
        child: DeatialAppbar(
          text: 'Doctor Details',
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/doctor.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 16),
            const Text(
              'Availability',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildDateRow(),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
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
            ElevatedButton(
              onPressed: () {
                int amount = 19900;
                RazorPay razorPayInstance = RazorPay();
                razorPayInstance.razorPay(amount.toString());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
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
