import 'package:doc2heal/presentation/view/welcomescreen/swipe_screen.dart';
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
          'assets/LogoappLogo.png',
        ),
      ),
    );
  }

  Future<void> gotosplash() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SwipeScreen()));
  }
}
