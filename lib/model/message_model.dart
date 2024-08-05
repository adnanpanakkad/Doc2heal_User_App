import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderemail;
  final String reciverID;
  final String message;
  final Timestamp timestamp;

  MessageModel({
    required this.senderID,
    required this.senderemail,
    required this.reciverID,
    required this.message,
    required this.timestamp,
  });

  // Convert Message object to a map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderemail': senderemail,
      'reciverID': reciverID,
      'message': message,
      'timestamp': timestamp,
    };
  }

  // Convert a map to a Message object
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderID: map['senderID'] as String,
      senderemail: map['senderemail'] as String,
      reciverID: map['reciverID'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}
