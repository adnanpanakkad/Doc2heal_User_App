import 'package:doc2heal/presentation/view/category_screen.dart';
import 'package:doc2heal/presentation/view/doctorlist_screen.dart';
import 'package:doc2heal/widgets/home/carousel.dart';
import 'package:doc2heal/widgets/home/category_row.dart';
import 'package:doc2heal/widgets/home/home_appbar.dart';
import 'package:doc2heal/widgets/home/section_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 15),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                HomeAppBar(),
                const CustomCarousel(),
                SectionTitle(
                  title: 'Categories',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
                  },
                ),
                const HomeCategoryRow(),
                const SizedBox(height: 10),
                SectionTitle(
                    title: 'Doctors',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DoctorsListScreen()));
                    }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
