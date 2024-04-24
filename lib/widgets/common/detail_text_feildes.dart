import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTextfield extends StatelessWidget {
  const DetailTextfield({
    super.key,
    this.validator,
     this.controller,
    required this.text,
  });
  final FormFieldValidator? validator;
  final TextEditingController ? controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          hintStyle:
              GoogleFonts.urbanist(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}