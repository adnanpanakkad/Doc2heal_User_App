import 'dart:io';
import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/common/custom_snacbar.dart';
import 'package:doc2heal/widgets/profile/editprofile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic>? userData;

  EditProfileScreen({required this.userData});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _genderController;
  late TextEditingController _birthdayController;
  String? _coverImagePath;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.userData!['name'] ?? '');
    _phoneController =
        TextEditingController(text: widget.userData!['phone'] ?? '');
    _genderController =
        TextEditingController(text: widget.userData!['gender'] ?? '');
    _birthdayController =
        TextEditingController(text: widget.userData!['age'] ?? '');
  }

  void _updateProfile() async {
    Map<String, dynamic> newData = {
      'coverimag': _coverImagePath ?? widget.userData!['coverimag'],
      'name': _nameController.text.isNotEmpty ? _nameController.text : '',
      'gender': _genderController.text.isNotEmpty ? _genderController.text : '',
      'age':
          _birthdayController.text.isNotEmpty ? _birthdayController.text : '',
      'phone': _phoneController.text.isNotEmpty ? _phoneController.text : '',
    };

    try {
      await UserRepository().updateUserProfile(user!.uid, newData);
      Navigator.of(context).pop();
      CustomSnackbar.show(context, 'Profile updated', Colors.green);
    } catch (e) {
      CustomSnackbar.show(context, 'Error updating profile: $e', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DeatialAppbar(
          onTap: () => Navigator.pop(context),
          text: 'Edit Profile',
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is SucessfullyPicimageEvent) {
              _coverImagePath = state.profilepath.toString();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  EditProfileAvathar(
                    image: widget.userData!['coverimag'],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          controller: _genderController,
                          decoration: InputDecoration(labelText: 'Gender'),
                        ),
                        TextField(
                          controller: _birthdayController,
                          decoration: InputDecoration(labelText: 'Age'),
                        ),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: 'Phone'),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _updateProfile,
                          child: Text('Update'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolor.primaryColor,
                          ),
                        ),
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
