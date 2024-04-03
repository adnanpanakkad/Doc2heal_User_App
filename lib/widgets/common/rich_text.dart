import 'package:doc2heal/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget richText(
    {required BuildContext context,
    required String firstTxt,
    required String secondTxt}) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: firstTxt,
            style: const TextStyle(
                color: Color.fromARGB(255, 102, 102, 102),
                fontFamily: 'Urbanist',
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: secondTxt,
            style: const TextStyle(
                fontFamily: 'Urbanist',
                color: Appcolor.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w700)),
      ],
    ),
  );
}
