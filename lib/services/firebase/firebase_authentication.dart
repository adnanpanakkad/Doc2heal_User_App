import 'dart:developer';
import 'package:doc2heal/presentation/screens/bottombar_screens.dart';
import 'package:doc2heal/presentation/screens/login_screen.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:doc2heal/widgets/common/custom_snacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  User? get authUser => _auth.currentUser;
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;
      log("${user?.displayName}");
    } catch (e) {
      log('Google Sign-In Error: $e');
      throw Exception('Google Sign-In Error: $e');
    }
  }

  Future<String?> userSignup(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');

      return userCredential.user?.uid;
    } catch (e) {
      log('User Email Signup Error: $e');
      throw Exception('User Email Signup Error: $e');
    }
  }

  Future<String?> userLogin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user =
          await UserRepository().getUserDetails(userCredential.user!.uid);

      log('User logged in');
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      user != null ? const BottombarScreens() : LoginScreen();
      log('User Email Login Error: ${e.message}');
      throw Exception('User Email Login Error: ${e.message}');
    } catch (e) {
      log('User Email Login Error: $e');
      throw Exception('User Email Login Error: $e');
    }
  }
}
