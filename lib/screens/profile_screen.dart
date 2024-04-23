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
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.green,
            ),
            // Curved container
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
              ),
            ),
            // Popup container
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 16.0,
              right: 16.0,
              child: Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Center(
                  child: Text(
                    'Popup Container',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //         appBar: AppBar(
    //   actions: [
    //     GestureDetector(
    //         onTap: () async {
    //           FirebaseAuth.instance.signOut();
    //           Navigator.of(context).pushAndRemoveUntil(
    //               MaterialPageRoute(builder: (ctx) => const LoginScreen()),
    //               (route) => false);
    //         },
    //         child: Icon(Icons.logout))
    //   ],
    // )
  }
}
