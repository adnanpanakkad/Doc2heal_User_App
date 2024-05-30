import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/presentation/view/login_screen.dart';
import 'package:doc2heal/widgets/profile/center_container.dart';
import 'package:doc2heal/widgets/profile/detail-continer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:doc2heal/widgets/profile/detail_tile.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:doc2heal/model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final String uid;

  ProfileScreen({required this.uid});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<Map<DocumentSnapshot, dynamic>>(
    //   future: UserRepository().getUserDetails(uid) as,
    //   builder: (BuildContext context,
    //       AsyncSnapshot<Map<DocumentSnapshot, dynamic>> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       } else {
    //         var userData = snapshot.data!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: CustomTextStyle
                    .highboldTxtStyle, // Assuming this is defined correctly
              ),
              SizedBox(height: 20),
              DetailContainer(),
              const SizedBox(height: 20),
              const CenterContainer(),
              CustomDetailCard(
                boxcolor: Colors.purple,
                iconcolor: Colors.white,
                iconData: Icons.error,
                iconButtonIcon: Icons.arrow_forward_ios,
                text: 'About',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              Text(
                'Account',
                style: CustomTextStyle.buttonTextStyle,
              ),
              SizedBox(height: 20),
              CustomDetailCard(
                iconcolor: Colors.red,
                iconData: Icons.logout_outlined,
                iconButtonIcon: Icons.arrow_forward_ios,
                text: 'Logout',
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} //else {
         // return const Center(child: CircularProgressIndicator());
        //}
     // },
   // );
  //}
//}
