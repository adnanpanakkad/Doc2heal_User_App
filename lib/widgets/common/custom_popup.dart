import 'package:doc2heal/presentation/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final void Function()? onTap;

  const CustomPopup({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Icon(
        Icons.report,
        color: Colors.red,
        size: 50,
      ),
      content: const Text('Are you sure you want to logout?',
          style: TextStyle(color: Colors.black)),
      actions: [
        ElevatedButton(
          child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
        ),
        ElevatedButton(
          child: const Text('Logout', style: TextStyle(color: Colors.red)),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ],
    );
  }
}
