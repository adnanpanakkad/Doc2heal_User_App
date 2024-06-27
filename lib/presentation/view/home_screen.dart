import 'package:doc2heal/presentation/view/category_list.dart';
import 'package:doc2heal/presentation/view/doctorlist_screen.dart';
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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white54,
          body: Column(
            children: [
               StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasData && snapshot.data != null) {
                      return HomeAppBar();
                    } else {
                      return const Text('User not logged in');
                    }
                  },
                ),
              const CustomCarousel(),
              SectionTitle(
                title: 'Categories',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CategoryListScreen()));
                },
              ),
              const HomeCategoryRow(),
              const SizedBox(height: 20),
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
    );
  }
}
