// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// class AuthenticationNavigate extends StatelessWidget {
//   const AuthenticationNavigate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     return Scaffold(
//       body: currentUser != null ? BottomScreen() : const SelectLoginScreen(),
//     );
//   }
// }