import 'package:flutter/material.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.imagpath,
  });

  final String imagpath;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagpath,
              height: 35,
            ),
            SizedBox(width: 50),
            Text(
              text,
              style: CustomTextStyle.buttonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
