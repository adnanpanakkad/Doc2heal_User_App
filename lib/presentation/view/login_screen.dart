import 'package:doc2heal/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:doc2heal/presentation/view/signup_screen.dart';
import 'package:doc2heal/presentation/view/bottombar_screens.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/network.dart';
import 'package:doc2heal/widgets/common/custom_snacbar.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/widgets/common/button.dart';
import 'package:doc2heal/widgets/common/rich_text.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ConnectivityUtils.checkInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const BottombarScreens(),
            ));
          }
        },
        child: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            if (state is Authloading) {
              return const Center(
                  child:
                      CircularProgressIndicator(color: Appcolor.primaryColor));
            }
            return SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              height: 250,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/undraw_Mobile_encryption_re_yw3o.png'))),
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 10),
                                  child: Text(
                                    "Login to your\nAccount",
                                    style: CustomTextStyle.ultraBoldTextstyle,
                                  ),
                                ),
                              ],
                            ),
                            CustomTextfield(
                                validation: (value) =>
                                    Validator.validateEmail(value),
                                hintText: "Enter Your Email",
                                controller: emailController),
                            CustomTextfield(
                              validation: (value) =>
                                  Validator.validatePassword(value),
                              hintText: "Enter Your Password",
                              controller: passwordController,
                            ),
                            const SizedBox(height: 30),
                            CustomButton(
                              text: 'Login',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );

                                    // If successful, navigate to next screen
                                    BlocProvider.of<AuthBloc>(context).add(
                                      Loginevent(
                                          email: email, password: password),
                                    );
                                  } catch (e) {
                                    CustomSnackbar.show(
                                      context: context,
                                      title: 'Login Failed',
                                      subtitle:
                                          'The email or password you entered is incorrect',
                                      color: Colors.red.shade600,
                                      icon: Icons.error_outline,
                                    );
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ));
                          },
                          child: richText(
                              context: context,
                              firstTxt: "Don't have an Account?  ",
                              secondTxt: "Sign up"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
