import 'package:doc2heal/presentation/view/profile/about_us_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/profile/detail-continer.dart';
import 'package:doc2heal/widgets/schedule/shimmer_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/presentation/view/login_screen.dart';
import 'package:doc2heal/widgets/common/custom_popup.dart';
import 'package:doc2heal/widgets/profile/center_container.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:doc2heal/widgets/profile/detail_tile.dart';

class SettingScreen extends StatelessWidget {
  final String uid;
  final Map<String, dynamic> userData;

  const SettingScreen({
    super.key,
    required this.uid,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.lightbackground,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: CustomTextStyle.highboldTxtStyle,
                ),
                const SizedBox(height: 20),
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerCard();
                    }
                    if (snapshot.hasData && snapshot.data != null) {
                      return DetailContainer();
                    } else {
                      return const Text('User not logged in');
                    }
                  },
                ),
                SizedBox(height: 25),
                const CenterContainer(),
                CustomDetailCard(
                  boxcolor: Colors.purple,
                  iconcolor: Colors.white,
                  iconData: Icons.error,
                  iconButtonIcon: Icons.arrow_forward_ios,
                  text: 'About',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutUsScreen(),
                    ));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Account',
                  style: CustomTextStyle.buttonTextStyle,
                ),
                const SizedBox(height: 20),
                CustomDetailCard(
                  iconcolor: Colors.red,
                  iconData: Icons.logout_outlined,
                  iconButtonIcon: Icons.arrow_forward_ios,
                  text: 'Logout',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomPopup(
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
