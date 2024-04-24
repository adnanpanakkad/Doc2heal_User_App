import 'package:doc2heal/widgets/profile/detail-continer.dart';
import 'package:doc2heal/widgets/profile/detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: CustomTextStyle.highboldTxtStyle,
              ),
              SizedBox(height: 20),
              DetailContainer(
                  profilepic: "profilepic",
                  name: "name",
                  email: "email",
                  phone: "phone"),
              SizedBox(height: 20),
              DetailCard(),
            ],
          ),
        ),
      ),
    );
  }
}
