import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderemail;
  final String reciverID;
  final String message;
  final Timestamp timestamp;
  Message({
    required this.senderemail,
    required this.reciverID,
    required this.message,
    required this.timestamp,
    required this.senderID,
  });
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderemail': senderemail,
      'reciverID': reciverID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
