import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ExceptionHandler {
  static String handleException(dynamic e) {
    if (e is FirebaseAuthException) {
      return _handleFirebaseAuthException(e);
    } else if (e is FirebaseException) {
      return 'Firebase Exception: ${e.message}';
    } else if (e is FormatException) {
      return 'Format Exception: ${e.message}';
    } else if (e is PlatformException) {
      return 'Platform Exception: ${e.message}';
    } else {
      return 'An unknown exception occurred.';
    }
  }

  static String _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      default:
        return 'Firebase Auth Exception: ${e.message}';
    }
  }
}