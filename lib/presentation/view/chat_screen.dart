import 'package:flutter/material.dart';
import 'package:doc2heal/utils/app_text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Messages',
                style: CustomTextStyle.highboldTxtStyle,
              ),
              Expanded(
                child: ListView.builder(
                  reverse: true, // To show the latest message at the bottom
                  itemCount: 10, // Example: 10 messages
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Message ${index + 1}'),
                      subtitle: Text('User ${index % 2 == 0 ? 'A' : 'B'}'),
                    );
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) {
                  // Handle message input
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
