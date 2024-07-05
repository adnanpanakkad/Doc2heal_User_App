import 'package:doc2heal/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final DateTime timestamp;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Appcolor.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            DateFormat('h:mm a').format(timestamp),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
