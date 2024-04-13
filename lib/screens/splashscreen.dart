import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/screens/bottombar_screens.dart';
import 'package:doc2heal/screens/user_detailes_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/screens/home_screen.dart';
import 'package:doc2heal/screens/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    gotosplash();
    return Scaffold(
      backgroundColor: Color.fromRGBO(53, 221, 130, 1),
      body: Center(
        child: Image.asset(
          alignment: Alignment.center,
          height: 120,
          width: 150,
          fit: BoxFit.fill,
          'assets/LogoappLogo.png',
        ),
      ),
    );
  }

  Future<void> gotosplash() async {
    await Future.delayed(Duration(seconds: 3));

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Check if the user data is fully filled
      final userData = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)  // Assuming you use the user ID as the document ID
          .get();

      if (userData.exists) {
        final data = userData.data();

        // Check if the data contains all the necessary fields
        bool isDataComplete = data != null &&
            data.containsKey('name') &&
            data.containsKey('phone') &&
            data.containsKey('email') &&
            data.containsKey('gender') &&
            data.containsKey('age');

        if (isDataComplete) {
          // User data is complete, navigate to HomeScreen
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const BottombarScreens()));
        } else {
          // User data is incomplete, navigate to SignupScreen
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const PersonalDetails()));
        }
      } else {
        // No data for this user in Firestore, navigate to SignupScreen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const SignupScreen()));
      }
    } else {
      // User is not logged in, navigate to SignupScreen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const SignupScreen()));
    }
  }
}
