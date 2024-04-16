import 'package:doc2heal/screens/login_screen.dart';
import 'package:doc2heal/screens/swipe_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
      actions: [
        GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SwipeScrenn()));
              });
            },
            child: Icon(Icons.logout))
      ],
    )));
  }
}
