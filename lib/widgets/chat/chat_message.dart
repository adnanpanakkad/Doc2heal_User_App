import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firebase_chat.dart';
import 'package:doc2heal/widgets/chat/chat_bubble.dart';
import 'package:doc2heal/widgets/chat/date_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessages extends StatelessWidget {
  final String reciverID;
  final Future<String> senderID;
  final ChatRepository chatrepo;
  final ScrollController scrollcontroller;

  const ChatMessages({
    super.key,
    required this.reciverID,
    required this.senderID,
    required this.chatrepo,
    required this.scrollcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: senderID,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        if (snapshot.hasError) {
          return const Text('Error');
        }
        return StreamBuilder(
          stream: chatrepo.getMessages(reciverID, snapshot.data!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading...');
            }

            var messages = snapshot.data!.docs;
            var groupedMessages = _groupMessagesByDate(messages);

            return ListView.builder(
              controller: scrollcontroller,
              itemCount: groupedMessages.length,
              itemBuilder: (context, index) {
                var date = groupedMessages.keys.elementAt(index);
                var dayMessages = groupedMessages[date]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DateHeader(date: date),
                    ...dayMessages.map((doc) => _buildMessageItem(doc)).toList(),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Map<String, List<DocumentSnapshot>> _groupMessagesByDate(
      List<DocumentSnapshot> messages) {
    Map<String, List<DocumentSnapshot>> groupedMessages = {};

    for (var message in messages) {
      var timestamp = message['timestamp'] as Timestamp;
      var date = DateFormat('yyyy-MM-dd').format(timestamp.toDate());

      if (!groupedMessages.containsKey(date)) {
        groupedMessages[date] = [];
      }

      groupedMessages[date]!.add(message);
    }

    return groupedMessages;
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final currentUser = FirebaseAuth.instance.currentUser;
    bool isCurrentUser = data['senderID'] == currentUser!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
            timestamp: (data['timestamp'] as Timestamp).toDate(),
          ),
        ],
      ),
    );
  }
}
