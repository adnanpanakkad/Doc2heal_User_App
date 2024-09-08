import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final IconData leadingIcon;
  final String text;
  final VoidCallback onTrailingIconPressed;

  const CustomRow({
    Key? key,
    required this.leadingIcon,
    required this.text,
    required this.onTrailingIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(leadingIcon),
            SizedBox(width: 8),
            Text(text),
          ],
        ),
        GestureDetector(
          onTap: onTrailingIconPressed,
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text(
              'Click here',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
