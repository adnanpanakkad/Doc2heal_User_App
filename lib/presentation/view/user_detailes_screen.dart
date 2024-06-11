import 'dart:io';
import 'package:doc2heal/model/user_model.dart';
import 'package:doc2heal/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/presentation/view/bottombar_screens.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/avathar_picker.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:doc2heal/widgets/person_table/detail_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  File? seletedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
  final List<String> items = ['None', 'Male', 'Female'];
  final String selectGender = 'None';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        appBar: const PreferredSize(
            preferredSize: Size(double.maxFinite, 70),
            child: DeatialAppbar(text: 'Personal Details')),
        body: BlocBuilder<AuthBloc, AuthBlocState>(
          builder: (context, state) {
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromARGB(255, 254, 254, 254),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(44, 112, 112, 112),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(5, 10),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Add your profile',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const ProfileAvathar(), //imge picker
                            ],
                          ),
                          const SizedBox(height: 30),
                          DetailTile(
                            validator: (value) =>
                                Validator().textFeildValidation(value),
                            keyboardType: TextInputType.name,
                            controllers: _nameController,
                            sub: 'full name',
                            hittext: 'Enter your full name',
                          ),
                          DetailTile(
                            validator: (value) =>
                                Validator().textFeildValidation(value),
                            controllers: _phoneController,
                            keyboardType: TextInputType.number,
                            sub: 'Phone number',
                            hittext: 'Enter your phone number',
                          ),
                          DetailTile(
                            controllers: _genderController,
                            validator: (value) =>
                                Validator().textFeildValidation(value),
                            sub: 'Gender',
                            hittext: "Enter your Gender",
                            keyboardType: TextInputType.name,
                          ),
                          DetailTile(
                            validator: (value) =>
                                Validator().textFeildValidation(value),
                            controllers: _ageController,
                            sub: 'Age',
                            hittext: "Enter your Age",
                            keyboardType: TextInputType.number,
                          ),
                          DetailTile(
                            validator: (value) =>
                                Validator.validateEmail(value),
                            keyboardType: TextInputType.emailAddress,
                            controllers: _emailController,
                            sub: 'email',
                            hittext: 'Enter your  email',
                          ),
                          DetailTile(
                            validator: (value) =>
                                Validator.validatePassword(value),
                            keyboardType: TextInputType.emailAddress,
                            controllers: _passwordController,
                            sub: 'Password',
                            hittext: 'Enter your  Password',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Appcolor.primaryColor,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              UserModel user = UserModel(
                name: _nameController.text.trim(),
                phone: _phoneController.text.trim(),
                gender: _genderController.text.trim(),
                age: _ageController.text.trim(),
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              );
              BlocProvider.of<AuthBloc>(context)
                  .add(Singupevent(usermodel: user));
              await Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const BottombarScreens(),
              ));
            }
          },
          label: const SizedBox(
            child: Row(
              children: [
                Text('Continue'),
                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
