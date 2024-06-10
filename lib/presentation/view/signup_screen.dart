// import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
// import 'package:doc2heal/services/firebase/firebase_authentication.dart';
// import 'package:doc2heal/presentation/view/login_screen.dart';
// import 'package:doc2heal/presentation/view/user_detailes_screen.dart';
// import 'package:doc2heal/utils/app_text_styles.dart';
// import 'package:doc2heal/widgets/common/button.dart';
// import 'package:doc2heal/widgets/common/auth_button.dart';
// import 'package:doc2heal/widgets/common/rich_text.dart';
// import 'package:doc2heal/widgets/common/textfield.dart';
// import 'package:doc2heal/widgets/common/validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignupScreen extends StatelessWidget {
//   SignupScreen({super.key});

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => ProfileBloc(),
//         child: BlocBuilder<ProfileBloc, ProfileState>(
//           builder: (context, state) {
//             return SafeArea(
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: Form(
//                         key: formKey,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 250,
//                               height: 250,
//                               decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage(
//                                       'assets/Mobile login-pana.png'),
//                                 ),
//                               ),
//                             ),
//                             const Row(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 10, horizontal: 10),
//                                   child: Text(
//                                     "Create your\nAccount",
//                                     style: CustomTextStyle.ultraBoldTextstyle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             CustomTextfield(
//                               validation: (value) =>
//                                   Validator.validateEmail(value),
//                               hintText: "Enter Your Email",
//                               controller: emailController,
//                             ),
//                             CustomTextfield(
//                               validation: (value) =>
//                                   Validator.validatePassword(value),
//                               hintText: "Enter Your Password",
//                               controller: passwordController,
//                             ),
//                             const SizedBox(height: 20),
//                             CustomButton(
//                               text: 'Sign-up',
//                               onTap: () async {
//                                 if (formKey.currentState!.validate()) {
//                                   await AuthenticationRepository().userSignup(
//                                     emailController.text,
//                                     passwordController.text,
//                                   );
//                                   Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(
//                                       builder: (context) => PersonalDetails(),
//                                     ),
//                                   );
//                                 }
//                               },
//                             ),
//                             const SizedBox(height: 30),
//                             const Text('OR'),
//                             const SizedBox(height: 15),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 AuthButton(
//                                   text: 'Sign-in with Google',
//                                   onTap: () async {
//                                     await AuthenticationRepository()
//                                         .googleSignIn();
//                                     Navigator.of(context).pushReplacement(
//                                       MaterialPageRoute(
//                                         builder: (context) => PersonalDetails(),
//                                       ),
//                                     );
//                                   },
//                                   imagpath: 'assets/2702602.png',
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 80,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginScreen()),
//                               );
//                             },
//                             child: richText(
//                               context: context,
//                               firstTxt: "Already have an Account?  ",
//                               secondTxt: "Login",
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }