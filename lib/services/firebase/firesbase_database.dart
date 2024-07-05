import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/model/doctor_model.dart';
import 'package:doc2heal/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  User? get authUser => _auth.currentUser;

  Future<String> getcurrentuser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user-not-authenticated',
        message: 'User not authenticated',
      );
    }
    return user.uid;
  }

  Future<UserModel?> saveUserData(UserModel user, String id) async {
    try {
      await _db.collection("user").doc(id).set(user.toJson());
    } catch (e) {
      throw 'not saved';
    }
    return null;
  }
  
  Stream<Map<String, dynamic>> getUserDetails(String userId) {
    return _db.collection('users').doc(userId).snapshots().map((snapshot) {
      return snapshot.data() as Map<String, dynamic>;
    });
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> getDoctors() {
    return _db.collection("doctor").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDoctorsBySpecialization(
      String specialization) {
    return _db
        .collection("doctor")
        .where('specialization', isEqualTo: specialization)
        .snapshots();
  }

  Future<String> getImageUrl(File imageFile) async {
    String uniqueName = DateTime.now().millisecond.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('userimages/$uniqueName');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    final String imageUrl = await snapshot.ref.getDownloadURL();
    log(imageUrl);
    return imageUrl;
  }

  Future<DoctorsModel?> getDoctorById(String id) async {
    try {
      final docSnapshot = await _db.collection('doctor').doc(id).get();
      if (docSnapshot.exists) {
        return DoctorsModel.fromSnapshot(docSnapshot);
      }
    } catch (error) {
      log('Error fetching user by ID: $error');
    }
    return null;
  }

  
}
