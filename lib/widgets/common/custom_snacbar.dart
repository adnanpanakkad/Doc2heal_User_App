import 'package:flutter/material.dart';

class Snacbar {
 customSnack(String message, BuildContext context, MaterialColor red) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 255, 87, 58),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: Text(
          message,
        )));
  }
}