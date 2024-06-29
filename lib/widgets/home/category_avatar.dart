import 'package:flutter/material.dart';
import 'package:doc2heal/presentation/view/category_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';

class HomeCategoryAvatar extends StatelessWidget {
  final String imagePath;
  final String? category;

  const HomeCategoryAvatar({
    super.key,
    required this.imagePath,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                      category: category!,
                    )));
      },
      child: Column(
        children: [
          Card(
            elevation: 5,
            color: Appcolor.primaryColor,
            child: CircleAvatar(
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
          ),
          Text(
            category!,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
