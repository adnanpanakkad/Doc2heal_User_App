import 'package:doc2heal/screens/bottombar_screens.dart';
import 'package:doc2heal/services/exception/network.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/screens/signup_screen.dart';
import 'package:doc2heal/widgets/common/button.dart';
import 'package:doc2heal/widgets/common/rich_text.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import '../../utils/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 300,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/undraw_Mobile_encryption_re_yw3o.png'))),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Text(
                              "Login to your\nAccount",
                              style: CustomTextStyle.ultraBoldTextstyle,
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                          text: 'Sigin in with Google',
                          onTap: () async {},
                          imagpath: 'assets/2702602.png'),
                      SizedBox(height: 20),
                      CustomButton(
                          text: 'Sigin in with Google',
                          onTap: () async {},
                          imagpath: 'assets/facebook_5968764.png'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // CustomButton(
                    //     text: "Sign in",
                    //     onTap: () async {
                    //       if (formKey.currentState!.validate()) {

                    //       }
                    //     }),

                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
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
            ),
          ],
        ),
      ),
    );
  }
}
