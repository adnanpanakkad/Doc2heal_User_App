import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SectionTitle({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CustomTextStyle.buttonTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: const Row(
                children: [
                  Text(
                    'seeall',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.blue,
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
