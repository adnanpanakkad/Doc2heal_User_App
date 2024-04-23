import 'package:flutter/material.dart';

class Snacbar {
 static authSnack(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 255, 87, 58),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: Text(
          message,
        )));
  }
}