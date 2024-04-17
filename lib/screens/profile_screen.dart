import 'package:cloud_firestore/cloud_firestore.dart';
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
              
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) => const LoginScreen()),
                  (route) => false);
            },
            child: Icon(Icons.logout))
      ],
    )));
  }
}
