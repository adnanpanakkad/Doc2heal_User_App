import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/button.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController userNameEditController = TextEditingController();
  final TextEditingController ageEditController = TextEditingController();
  final TextEditingController genderEditController = TextEditingController();
  final TextEditingController phoneEditController = TextEditingController();
  final GlobalKey<FormState> editkey = GlobalKey<FormState>();
  ImageProvider? _imageProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, 70),
            child: DeatialAppbar(
                text: 'Edit Profile',
                onTap: () {
                  Navigator.pop(context);
                })),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: editkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * .04),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: const Color.fromARGB(255, 143, 189, 198),
                        backgroundImage: _imageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: size.width * .05,
                        child: Container(
                          height: size.height * .04,
                          width: size.width * .08,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pickImage(context);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  CustomTextfield(
                    validation: (value) => Validator().textFeildValidation(value),
                    controller: userNameEditController,
                    hintText: 'Name',
                  ),
                  SizedBox(height: size.height * .02),
                  CustomTextfield(
                    validation: (value) => Validator().textFeildValidation(value),
                    controller: ageEditController,
                    hintText: 'Age',
                  ),
                  SizedBox(height: size.height * .02),
                  CustomTextfield(
                    validation: (value) => Validator().textFeildValidation(value),
                    controller: genderEditController,
                    hintText: 'Gender',
                  ),
                  SizedBox(height: size.height * .02),
                  CustomTextfield(
                    validation: (value) => Validator().textFeildValidation(value),
                    controller: phoneEditController,
                    hintText: 'Phone Number',
                  ),
                  SizedBox(height: size.height * .02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    child: CustomButton(
                      text: 'Update',
                      onTap: () {
                        if (editkey.currentState!.validate()) {
                          // Handle update action
                          // You might want to save the updated user data here
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  // Pick image from camera
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  // Pick image from gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
