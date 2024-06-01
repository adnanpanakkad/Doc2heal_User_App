import 'package:flutter/material.dart';
import 'package:doc2heal/presentation/view/category_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';

class HomeCategoryAvatar extends StatelessWidget {
  final String imagePath;
  final String? text;

  const HomeCategoryAvatar({
    super.key,
    required this.imagePath,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryScreen()));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Appcolor.primaryColor,
            child: ClipOval(
              child: Center(
                child: SizedBox(
                  width: 40,
                  height: 47,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Text(
            text!,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
