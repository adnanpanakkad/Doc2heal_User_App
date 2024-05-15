import 'package:carousel_slider/carousel_slider.dart';
import 'package:doc2heal/presentation/screens/login_screen.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<IconData> hospitalityIcons = [
    Icons.restaurant,
    Icons.hotel,
    Icons.local_cafe,
    Icons.local_pizza,
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
                CarouselSlider(
                  options: CarouselOptions(
                    animateToClosest: true,
                    autoPlayCurve: Curves
                        .easeIn, // Adjusted to account for the ClipRRect padding
                    aspectRatio:
                        2.0, // Adjusted to account for the ClipRRect padding
                    enlargeCenterPage: true,
                    autoPlay: true, // Enable automatic sliding
                    autoPlayInterval:
                        Duration(seconds: 5), // Duration between slides
                  ),
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the radius for desired curvature
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXFqXO2nFAxGgTn8Lzg0mNpZxXD8FhMn6wbA&s',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius for desired curvature
                      child: Image.network(
                        'https://cdn.dribbble.com/users/7541902/screenshots/17912507/media/3786ac1fc4fffcc009d1d8fb47c556b6.jpg?resize=400x0',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius for desired curvature
                      child: Image.network(
                        'https://img.freepik.com/premium-psd/medical-social-media-facebook-cover-web-banner-template_220159-141.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: CustomTextStyle.buttonTextStyle,
                    ),
                    Text(
                      'seeall',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                  ),
                  itemCount:
                      hospitalityIcons.length, // Number of items in the grid
                  itemBuilder: (BuildContext context, int index) {
                    // Use the icon from the list based on the index
                    return Icon(hospitalityIcons[index], size: 70);
                  },
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Doctors',
                      style: CustomTextStyle.buttonTextStyle,
                    ),
                    Text(
                      'see All',
                      style: TextStyle(color: Colors.blue),
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
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVAAtEKf0r5SivJpR8Ek-crrJ3fWtSMknuzg&s',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          height: 250,
                          width: 150,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqVOA4o6ryqDlQRuk9JCJae16oojo9BLFl-A&s',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
