import 'dart:developer';
import 'package:doc2heal/screens/bottombar_screens.dart';
import 'package:doc2heal/screens/login_screen.dart';
import 'package:doc2heal/widgets/common/custom_snacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? currentUser = FirebaseAuth.instance.currentUser;
  static Future<void> googleSignIn() async {
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

  static Future<UserCredential> userEmailSignup(
      String email, String password,BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');

      return userCredential;
    } catch (e) {
       Snacbar.authSnack("please enter valid email and password", context);
      log('User Email Signup Error: $e');
      throw Exception('User Email Signup Error: $e');
    }
  }

  static Future<UserCredential> userEmailLogin(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log('User logged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Snacbar.authSnack("please enter valid email and password", context);
      currentUser != null ? BottombarScreens() : const LoginScreen();
      log('User Email Login Error: ${e.message}');
      throw Exception('User Email Login Error: ${e.message}');
    } catch (e) {
      log('User Email Login Error: $e');
      throw Exception('User Email Login Error: $e');
    }
  }
}
