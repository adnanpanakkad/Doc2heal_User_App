import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
        ),
        title: Container(
          width: double.infinity,
          height: 10.0,
          color: Colors.white,
        ),
        subtitle: Container(
          width: double.infinity,
          height: 10.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
