import 'package:doc2heal/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:doc2heal/presentation/view/signup_screen.dart';
import 'package:doc2heal/presentation/view/bottombar_screens.dart';
import 'package:doc2heal/utils/network.dart';
import 'package:doc2heal/widgets/common/custom_snacbar.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:doc2heal/widgets/common/button.dart';
import 'package:doc2heal/widgets/common/rich_text.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      body: BlocBuilder<AuthBloc, AuthBlocState>(
        builder: (context, state) {
          if (state is Authenticated) {
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => const BottombarScreens(),
            // ));
          } else if (state is AuthenticateError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              CustomSnackbar.show(
                  context, 'Invalid email or password', Colors.red);
            });
          } else if (state is Authloading) {
            return const Center(child: CircularProgressIndicator());
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
                                  BlocProvider.of<AuthBloc>(context).add(
                                      Loginevent(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim()));
                                  await Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottombarScreens()));
                                }
                              }),
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
    );
  }
}
