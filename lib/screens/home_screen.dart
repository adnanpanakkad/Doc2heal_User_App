import 'package:doc2heal/screens/login_screen.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                Image.network(
                    height: 200,
                    width: 500,
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXFqXO2nFAxGgTn8Lzg0mNpZxXD8FhMn6wbA&s'),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: CustomTextStyle.buttonTextStyle,
                    ),
                    Text(
                      'see All',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.heart_broken,
                      size: 70,
                    ),
                    Icon(
                      Icons.legend_toggle_rounded,
                      size: 70,
                    ),
                    Icon(
                      Icons.abc,
                      size: 70,
                    ),
                    Icon(
                      Icons.abc,
                      size: 70,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.abc,
                      size: 70,
                    ),
                    Icon(
                      Icons.abc,
                      size: 70,
                    ),
                    Icon(
                      Icons.abc,
                      size: 70,
                    ),
                    // Icon(
                    //   Icons.abc,
                    //   size: 70,
                    // ),
                  ],
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      child: Image.network(
                          fit: BoxFit.contain,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVAAtEKf0r5SivJpR8Ek-crrJ3fWtSMknuzg&s'),
                    ),
                    Container(
                      height: 250,
                      width: 150,
                      child: Image.network(
                          fit: BoxFit.contain,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqVOA4o6ryqDlQRuk9JCJae16oojo9BLFl-A&s'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
