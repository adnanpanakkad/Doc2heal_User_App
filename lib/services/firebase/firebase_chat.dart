import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/model/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//create new message
  Future<void> sendMessage(String resiverID, message) async {
    final currentUserID = auth.currentUser!.uid;
    final currentUserEmail = auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(
      senderID: currentUserID,
      senderemail: currentUserEmail!,
      reciverID: resiverID,
      message: message,
      timestamp: timestamp,
    );

//  construct the rooomid
    List<String> ids = [currentUserID, resiverID];
    ids.sort();
    String charRoomID = ids.join('_');

    // add message to  database
    await _firestore
        .collection('chat')
        .doc(charRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection('chat')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
