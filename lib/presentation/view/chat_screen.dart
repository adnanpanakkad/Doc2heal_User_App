import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firebase_chat.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/chat/chat_bubble.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String reciverEmail;
  final String reciverID;

  const ChatScreen({
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
  FocusNode myfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    senderID = userepo.getcurrentuser();
    myfocusNode.addListener(() {
      if (myfocusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });
    Future.delayed(Duration(milliseconds: 500), () => scrollDown());
  }

  @override
  void dispose() {
    myfocusNode.dispose();
    messageController.dispose();

    super.dispose();
  }

  ScrollController _scrollcontroller = ScrollController();

  void scrollDown() {
    _scrollcontroller.animateTo(
      _scrollcontroller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatrepo.sendMessage(widget.reciverID, messageController.text);
      messageController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 70),
          child: DeatialAppbar(
            text: widget.reciverEmail,
            onTap: () {
              Navigator.of(context).pop();
            },
          )),
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
              controller: _scrollcontroller,
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
    bool isCurrentUser = data['senderID'] == userepo.getcurrentuser();

    var aligment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: aligment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser)
          ],
        ));

    // Adjust according to your message structure
  }

  Widget buildUserinput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CustomTextfield(
              focusNode: myfocusNode,
              controller: messageController,
              hintText: 'type message',
            ),
          )),
          Container(
            decoration: const BoxDecoration(
              color: Appcolor.primaryColor,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
