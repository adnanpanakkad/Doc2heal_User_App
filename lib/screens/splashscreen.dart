import 'package:doc2heal/screens/home_screen.dart';
import 'package:doc2heal/screens/signup_screen.dart';
import 'package:doc2heal/screens/swipe_screen.dart';
import 'package:doc2heal/screens/user_detailes_screen.dart';
import 'package:doc2heal/widgets/person_table/person_table.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
            'assets/LogoappLogo.png'),
      ),
    );
  }

  Future<void> gotosplash() async {
    await Future.delayed(Duration(seconds: 3));

    if (FirebaseAuth.instance.currentUser != null) {
      print('user is logged in/////////////');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    } else {
      print('user not  logged in/////////');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const SignupScreen()));
    }
  }
}
