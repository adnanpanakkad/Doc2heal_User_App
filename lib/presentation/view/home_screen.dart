import 'package:doc2heal/presentation/view/category_list.dart';
import 'package:doc2heal/presentation/view/doctorlist_screen.dart';
import 'package:doc2heal/widgets/home/carousel.dart';
import 'package:doc2heal/widgets/home/category_row.dart';
import 'package:doc2heal/widgets/home/doctor_card.dart';
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
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Scaffold(
          body: Column(
            children: [
              const HomeAppBar(),
              const CustomCarousel(),
              SectionTitle(
                title: 'Categories',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CategoryListScreen()));
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
              const DoctorGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
