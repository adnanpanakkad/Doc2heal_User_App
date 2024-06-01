import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Messages',
                    style: CustomTextStyle
                        .highboldTxtStyle, // Ensure CustomTextStyle is defined
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam_outlined,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
