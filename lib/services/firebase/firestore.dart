import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/model/user_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///  function to save user data to Firestore
  Future<void> saveUserData(UserModel user, id) async {
    try {
      await _db.collection("user").doc(id).set(user.toJson());
    } catch (e) {
      throw Exception('data not saved') ;
    }
  }

  /// Function to fetch user data from Firestore by user ID
  Future<UserModel> getUserById(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _db.collection("user").doc(userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        return UserModel.fromJson(userData);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw 'not found data';
    }
  }
}
