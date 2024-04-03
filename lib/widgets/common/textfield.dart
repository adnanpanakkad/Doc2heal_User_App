import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.controller,
      required this.hintText,
      this.validation,
      this.suffixIcon,
      this.keyboardType,
      this.readOnly,
      this.onChanged});
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String hintText;
  final FormFieldValidator? validation;
  final bool? readOnly;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        validator: validation,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          hintStyle: CustomTextStyle.textFieldstyle,
          fillColor: const Color.fromARGB(255, 237, 237, 237),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 210, 210, 210),
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Appcolor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
