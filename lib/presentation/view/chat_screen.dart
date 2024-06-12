import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firebase_chat.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String reciverEmail;
  final String reciverID;

  ChatScreen({
    super.key,
    required this.reciverEmail,
    required this.reciverID,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final ChatRepository chatrepo = ChatRepository();
  final UserRepository userepo = UserRepository();
  late Future<String> senderID;

  @override
  void initState() {
    super.initState();
    senderID = userepo.getcurrentuser();
  }

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatrepo.sendMessage(widget.reciverID, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciverEmail),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          buildUserinput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
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
          stream: chatrepo.getMessages(widget.reciverID, snapshot.data!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading...');
            }
            return ListView(
              children: snapshot.data!.docs
                  .map((doc) => _buildmessageitem(doc))
                  .toList(),
            );
          },
        );
      },
    );
  }

  Widget _buildmessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 150, bottom: 10),
      child: Container(
        color: Appcolor.primaryColor,
        height: 30,
        width: 20,
        child: Text(data['message']),
      ),
    );

    // Adjust according to your message structure
  }

  Widget buildUserinput() {
    return Row(
      children: [
        Expanded(
            child: CustomTextfield(
          controller: messageController,
          hintText: 'type message',
        )),
        IconButton(
          onPressed: sendMessage,
          icon: Icon(Icons.send),
        )
      ],
    );
  }
}
