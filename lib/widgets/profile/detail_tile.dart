import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDetailCard extends StatelessWidget {
  final IconData? iconData;
  final Color? boxcolor;
  final Color? iconcolor;
  final IconData? iconButtonIcon; // Change this to IconData?
  final String? text;
  final void Function()? onTap;

  const CustomDetailCard({
    super.key,
    required this.iconData,
    required this.iconButtonIcon, // Use this for the IconButton icon
    required this.text,
    required this.onTap,
    this.boxcolor,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1.5,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 1,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: boxcolor, borderRadius: BorderRadius.circular(30)),
              child: Icon(
                iconData,
                color: iconcolor,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 130),
                  child: Text(
                    text!,
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                ),
              ),
            ),
            IconButton(
              iconSize: 16,
              icon: Icon(
                  iconButtonIcon), // Use the new iconData for the IconButton
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
