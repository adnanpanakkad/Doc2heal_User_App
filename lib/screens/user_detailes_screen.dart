import 'package:doc2heal/screens/home_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/appbar/appbar.dart';
import 'package:doc2heal/widgets/common/validator.dart';
import 'package:doc2heal/widgets/person_table/detail_tile.dart';
import 'package:doc2heal/widgets/person_table/person_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final DateTime _selectedDate = DateTime.now();
  TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender; // Add a variable to store the selected gender

  // Define the method to handle the selected gender
  void selectGender(String? newValue) {
    setState(() {
      selectedGender = newValue;
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
                        SizedBox(height: 20),
                        SizedBox(
                          child: Stack(
                            alignment: const Alignment(1, 1),
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/Ellipse 1.png'),
                                radius: 55,
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
                    SizedBox(height: 30),
                    DetailTile(
                      validator: (value) =>
                          Validator().textFeildValidation(value),

                      keyboardType: TextInputType.number,
                      // controllers: controller.phoneController,
                      sub: 'full name',
                      hittext: 'Enter your full name',
                    ),
                    DetailTile(
                      validator: (value) =>
                          Validator().textFeildValidation(value),

                      keyboardType: TextInputType.number,
                      // controllers: controller.phoneController,
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
                      // controllers: controller.emailContorllers,
                      sub: 'Email',
                      hittext: 'Enter your email address',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailTile(
                      validator: (value) =>
                          Validator().textFeildValidation(value),
                      sub: 'Gender',
                      hittext: "your Gender",
                      suffixicon: DropdownButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          iconDisabledColor:
                              const Color.fromARGB(252, 103, 103, 103),
                          items: [
                            "Male",
                            "Female",
                            "Other"
                          ] // Update options here
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

                      // controllers: controller.birthController,
                      sub: 'Age',
                      hittext: "Enter your Age",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // DetailTile(
                    //   validator: (value) =>
                    //       Validator().textFeildValidation(value),

                    //   keyboardType: TextInputType.number,
                    //   //controllers: controller.expController,
                    //   sub: 'Address',
                    //   hittext: 'Enter your Address',
                    // ),
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
