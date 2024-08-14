import 'package:doc2heal/presentation/view/category_list.dart';
import 'package:doc2heal/presentation/view/doctorlist_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/home/carousel.dart';
import 'package:doc2heal/widgets/home/category_row.dart';
import 'package:doc2heal/widgets/home/doctor_card.dart';
import 'package:doc2heal/widgets/home/home_appbar.dart';
import 'package:doc2heal/widgets/home/section_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String uid;
  final Map<String, dynamic> userData;
  const HomeScreen({super.key, required this.uid, required this.userData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.lightbackground,
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                          color: Appcolor.primaryColor);
                    }
                    if (snapshot.hasData && snapshot.data != null) {
                      return HomeAppBar();
                    } else {
                      return const Text('User not logged in');
                    }
                  },
                ),
                const CustomCarousel(),
                const SizedBox(height: 15),
                SectionTitle(
                  title: 'Categories',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategoryListScreen()));
                  },
                ),
                const HomeCategoryRow(),
                const SizedBox(height: 25),
                SectionTitle(
                    title: 'Doctors',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DoctorsListScreen()));
                    }),
                const DoctorGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
