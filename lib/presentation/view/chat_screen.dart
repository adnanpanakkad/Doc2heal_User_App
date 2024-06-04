import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with the actual image URL
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // This Expanded widget will take up the remaining space
          Expanded(
            child: Container(
              // This container will be used to display messages
              color: Colors.grey[200], // Just a placeholder color
              child: const Center(
                child: Text('Chat messages go here'),
              ),
            ),
          ),
          // This Container widget will hold the TextField and the Send button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle message send
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
