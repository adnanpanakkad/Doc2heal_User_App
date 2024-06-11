import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/home/category_avatar.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  final List<Map<String, String>> categories = const [
    {'imagePath': 'assets/heart.png', 'category': 'Cardiology'},
    {'imagePath': 'assets/tooth.png', 'category': 'Dental'},
    {'imagePath': 'assets/eye.png', 'category': 'Ophthalmology'},
    {'imagePath': 'assets/pediatrics.png', 'category': 'Pediatrics'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: DeatialAppbar(
          text: 'Category List',
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.5, // Adjust this ratio to change the item height
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: HomeCategoryAvatar(
                    imagePath: category['imagePath']!,
                    category: category['category']!,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
