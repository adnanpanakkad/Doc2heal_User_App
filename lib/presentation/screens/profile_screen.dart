import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/presentation/screens/login_screen.dart';
import 'package:doc2heal/widgets/profile/center_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:doc2heal/widgets/profile/detail-continer.dart';
import 'package:doc2heal/widgets/profile/detail_tile.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:doc2heal/model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserModel> _userModelFuture;

  @override
  void initState() {
    super.initState();
    _userModelFuture = UserRepository().getUserById('0', 'user');
  }

  Future<UserModel> _loadUserData() async {
    final _db = FirebaseFirestore.instance.collection('user');
    try {
      // Replace 'your_user_id' with the actual user ID
      return await UserRepository().getUserById('0', 'user');
    } catch (e) {
      // Handle error
      throw 'Error fetching user data: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: CustomTextStyle.highboldTxtStyle,
              ),
              const SizedBox(height: 20),
              FutureBuilder<UserModel>(
                future: _userModelFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show loading indicator while fetching data
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final user = snapshot.data!;
                    return DetailContainer(
                      profilepic: user
                          .profilepath!, // Assuming profile pic URL is stored in user model
                      name: user.name,
                      email: user.age,
                      phone: user.phone,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const CenterContainer(),
              CustomDetailCard(
                  boxcolor: Colors.purple,
                  iconcolor: Colors.white,
                  iconData: Icons.error,
                  iconButtonIcon: Icons.arrow_forward_ios,
                  text: 'About',
                  onTap: () {}),
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
                  text: 'logout',
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
