import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/screens/home_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/appbar/appbar.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:doc2heal/widgets/person_table/detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  File? seletedImage;
  final DateTime _selectedDate = DateTime.now();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender; // Add a variable to store the selected gender

  // Define the method to handle the selected gender
  void selectGender(String? newValue) {
    setState(() {
      selectedGender = newValue ?? 'None';
      _genderController.text = selectedGender!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 70),
          child: DeatialAppbar(text: 'Personal Details')),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: Stack(
                            alignment: const Alignment(1, 1),
                            children: [
                              CircleAvatar(
                                radius: 55,
                                backgroundImage: seletedImage == null
                                    ? const AssetImage('assets/Ellipse 1.png')
                                    : FileImage(seletedImage!) as ImageProvider,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    imagepicker();
                                  },
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromARGB(255, 229, 229, 229),
                                    child: Icon(
                                      Icons.add,
                                      color: Appcolor.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                      controllers: _PhoneController,
                      keyboardType: TextInputType.number,
                      sub: 'Phone number',
                      hittext: 'Enter your phone number',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailTile(
                      validator: (value) =>
                          Validator().textFeildValidation(value),
                      keyboardType: TextInputType.emailAddress,
                      controllers: _emailController,
                      sub: 'Email',
                      hittext: 'Enter your email address',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailTile(
                      controllers: _genderController,
                      validator: (value) =>
                          Validator().textFeildValidation(value),
                      sub: 'Gender',
                      hittext: "your Gender",
                      suffixicon: DropdownButton(
                          value: selectedGender,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: ["None", "Male", "Female"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: selectGender),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailTile(
                      validator: (value) =>
                          Validator().textFeildValidation(value),
                      controllers: _ageController,
                      sub: 'Age',
                      hittext: "Enter your Age",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Appcolor.primaryColor,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            CollectionReference collref =
                FirebaseFirestore.instance.collection('user');
            collref.add({
              'name': _nameController.text,
              'phone': _PhoneController.text,
              'email': _emailController.text,
              'gender': _genderController.text,
              'age': _ageController.text,
            });

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
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
    );
  }

  Future imagepicker() async {
    final pikedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pikedImage == null) return;
    setState(() {
      seletedImage = File(pikedImage.path);
    });
  }
}
