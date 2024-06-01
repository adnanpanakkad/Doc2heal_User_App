import 'package:doc2heal/widgets/home/category_avatar.dart';
import 'package:flutter/material.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeCategoryAvatar(
          imagePath: 'assets/heart.png',
          text: 'cardio',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/tooth.png',
          text: 'dental',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/eye.png',
          text: 'ortho',
        ),
        HomeCategoryAvatar(
          imagePath: 'assets/pediatrics.png',
          text: 'pediatrics',
        ),
      ],
    );
  }
}
