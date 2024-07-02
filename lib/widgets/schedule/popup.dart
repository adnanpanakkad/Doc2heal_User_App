import 'package:doc2heal/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  final String? message;
  final void Function()? onTap;

  const Popup({
    super.key,
    required this.onTap,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Icon(
        Icons.report,
        color: Colors.red,
        size: 50,
      ),
      content: Text(message!, style: TextStyle(color: Colors.black)),
      actions: [
        ElevatedButton(
          child:
              const Text('No', style: TextStyle(color: Appcolor.primaryColor)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 20),
        ElevatedButton(
          child: const Text('Yes', style: TextStyle(color: Colors.red)),
          onPressed: onTap,
        ),
      ],
    );
  }
}
