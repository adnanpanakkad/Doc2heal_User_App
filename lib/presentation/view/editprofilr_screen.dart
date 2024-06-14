import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController userNameEditController = TextEditingController();
  final TextEditingController ageEditController = TextEditingController();
  final TextEditingController phoneEditController = TextEditingController();
  ImageProvider? _imageProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * .04),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
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
              SizedBox(
                height: size.height * .45,
                child: Form(
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: phoneEditController,
                        hintText: 'name',
                      ),
                      SizedBox(height: size.height * .02),
                      CustomTextfield(
                        controller: phoneEditController,
                        hintText: 'age',
                      ),
                      SizedBox(height: size.height * .02),
                      CustomTextfield(
                        controller: phoneEditController,
                        hintText: 'Phone Number',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * .02),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(size.width * .9, size.height * .058),
                  ),
                ),
                onPressed: () {
                  // Action on button press
                },
                child: const Text('UPDATE'),
              ),
            ],
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

  // Custom text field widget
  Widget CustomTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
