import 'package:carousel_slider/carousel_slider.dart';
import 'package:doc2heal/presentation/view/category_screen.dart';
import 'package:doc2heal/presentation/view/doctorlist_screen.dart';
import 'package:doc2heal/presentation/view/login_screen.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:doc2heal/widgets/home/carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<IconData> hospitalityIcons = [
    Icons.heart_broken_sharp,
    Icons.child_care,
    Icons.hearing_disabled_rounded,
    Icons.healing,
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 15),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('hi hello'),
                    CircleAvatar(
                      radius: 20,
                    ),
                  ],
                ),
                CustomCarousel(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Category',
                      style: CustomTextStyle.buttonTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle "seeall" tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryScreen()), // Replace with your Category screen
                        );
                      },
                      child: const Text(
                        'seeall',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: hospitalityIcons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Icon(hospitalityIcons[index], size: 70);
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Doctors',
                      style: CustomTextStyle.buttonTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle "see All" tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DoctorsListScreen()), // Replace with your Doctors screen
                        );
                      },
                      child: const Text(
                        'see All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        child: Container(
                          height: 250,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVAAtEKf0r5SivJpR8Ek-crrJ3fWtSMknuzg&s',
                                fit: BoxFit.contain,
                                height: 150, // Adjusted height for image
                                width: double.infinity,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Doctor Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          height: 250,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqVOA4o6ryqDlQRuk9JCJae16oojo9BLFl-A&s',
                                fit: BoxFit.contain,
                                height: 150, // Adjusted height for image
                                width: double
                                    .infinity, // Make image take full width of the container
                              ),
                              const SizedBox(
                                  height:
                                      8), // Add some space between image and text
                              const Text(
                                'Doctor Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
