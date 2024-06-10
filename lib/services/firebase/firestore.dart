import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  User? get authUser => _auth.currentUser;
  Future<UserModel?> saveUserData(UserModel user, String id) async {
    try {
      await _db.collection("user").doc(id).set(user.toJson());
    } catch (e) {
      throw 'not saved';
    }
    return null;
  }

  Future<DocumentSnapshot> getUserDetails(String id) async {
    try {
      DocumentSnapshot snapshot = await _db.collection("user").doc(id).get();
      // final snapshot = await _db
      //     .collection("doctor")
      //     .doc(authenticationRepository.authUser!.uid)
      //     .get();
      return snapshot;
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors() {
    return _db.collection("doctor").snapshots();
  }

  Future<String> getImageUrl(File imageFile) async {
    String uniqueName = DateTime.now().millisecond.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('userimages/$uniqueName');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    final String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
    
  }
}
