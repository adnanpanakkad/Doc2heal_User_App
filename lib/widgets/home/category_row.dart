import 'package:doc2heal/widgets/home/category_avatar.dart';
import 'package:flutter/material.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HomeCategoryAvatar(
          imagePath: 'assets/heart.png',
          category: 'Cardiology',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/tooth.png',
          category: 'Dental',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/eye.png',
          category: 'Ophthalmology',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/pediatrics.png',
          category: 'Pediatrics',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/pregnant.png',
          category: 'Gynecology',
        ),
      ],
    );
  }
}
