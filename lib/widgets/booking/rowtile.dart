import 'package:flutter/material.dart';

Widget rowTile(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          value ?? '',
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
