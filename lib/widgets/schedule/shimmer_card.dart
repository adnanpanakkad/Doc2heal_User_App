import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: Duration(seconds: 1),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          color: Colors.white70, // Background color of the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          elevation: 4, // Shadow under the card
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding inside the card
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use minimum space
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30, // Size of the avatar
                      backgroundColor:
                          Colors.white, // Background color of the avatar
                    ),
                    const SizedBox(
                        width: 10), // Space between the avatar and the text
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        children: [
                          Container(
                            width: double.infinity,
                            height: 10.0,
                            color: Colors.white, // Placeholder for title
                          ),
                          Container(
                            width: double.infinity,
                            height: 10.0,
                            color: Colors.white, // Placeholder for subtitle
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30, // Size of the avatar
                      backgroundColor:
                          Colors.white, // Background color of the avatar
                    ),
                    const SizedBox(
                        width: 10), // Space between the avatar and the text
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        children: [
                          Container(
                            width: double.infinity,
                            height: 10.0,
                            color: Colors.white, // Placeholder for title
                          ),
                          Container(
                            width: double.infinity,
                            height: 10.0,
                            color: Colors.white, // Placeholder for subtitle
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
