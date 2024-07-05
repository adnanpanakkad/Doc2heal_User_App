// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:doc2heal/presentation/view/appoinmentscreen/cancelled_screen.dart';
import 'package:doc2heal/presentation/view/appoinmentscreen/completed_screen.dart';
import 'package:doc2heal/presentation/view/appoinmentscreen/upcoming_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFFFFFFF),
          title: const Text(
            'Appointment',
            style: CustomTextStyle.highboldTxtStyle,
          ),
          bottom: TabBar(
              labelColor: Appcolor.primaryColor,
              unselectedLabelColor: const Color(0xFF778293),
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xffc778293),
              ),
              indicatorColor: Appcolor.primaryColor,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            UpcomingScreen(),
            CompletedScreen(),
            CancelledScreen(),
          ],
        ),
      ),
    );
  }
}
