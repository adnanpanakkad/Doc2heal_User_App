import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: GestureDetector(
                  onTap: () async {
                    try {
                    await FirebaseAuth.instance.signOut();
                    
                    } catch (e) {
                      print(e); 
                    }
                  },
                  child: Icon(Icons.logout)))),
    );
  }
}
