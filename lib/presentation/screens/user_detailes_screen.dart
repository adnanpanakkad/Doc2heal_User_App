import 'dart:io';
import 'package:doc2heal/model/user_model.dart';
import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/presentation/screens/bottombar_screens.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/appbar/appbar.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:doc2heal/widgets/person_table/detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});
  File? seletedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> items = ['None', 'Male', 'Female'];
  final String selectGender = 'None';

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
              height: 50,
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
                                    //  imagepicker();
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
                      controllers: _phoneController,
                      keyboardType: TextInputType.number,
                      sub: 'Phone number',
                      hittext: 'Enter your phone number',
                    ),
                    BlocListener<ProfileBloc, ProfileState>(
                      listener: (context, state) {
                        if (state is GenderPickState) {
                          _genderController.text = state.selectGender;
                        }
                      },
                      child: DetailTile(
                        controllers: _genderController,
                        validator: (value) =>
                            Validator().textFeildValidation(value),
                        sub: 'Gender',
                        hittext: "your Gender",
                        suffixicon: DropdownButton(
                          value: selectGender,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            context
                                .read<ProfileBloc>()
                                .add(GenderPickEvent(selectGender: newValue!));
                          },
                        ),
                      ),
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
                          Validator().textFeildValidation(value),
                      keyboardType: TextInputType.emailAddress,
                      controllers: _addressController,
                      sub: 'Address',
                      hittext: 'Enter your  Address',
                    ),
                    DetailTile(
                      validator: (value) =>
                          Validator().textFeildValidation(value),
                      keyboardType: TextInputType.emailAddress,
                      controllers: _placeController,
                      sub: 'Place',
                      hittext: 'Enter your  Place',
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
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            UserModel user = UserModel(
              profilepath: seletedImage!.path,
              name: _nameController.text.trim(),
              phone: _phoneController.text.trim(),
              gender: _genderController.text.trim(),
              age: _ageController.text.trim(),
              address: _addressController.text.trim(),
              place: _placeController.text.trim(),
              isUser: true,
            );

            await UserRepository().saveUserData(user, '1'); // Pass userId here

            await Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BottombarScreens(),
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
    );
  }


}
