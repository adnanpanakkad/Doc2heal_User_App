import 'package:doc2heal/screens/home_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/widgets/appbar/appbar.dart';
import 'package:doc2heal/widgets/person_table.dart/detail_tile.dart';
import 'package:doc2heal/widgets/person_table.dart/person_table.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 70),
          child: DeatialAppbar(text: 'Personal Details')),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          //personl table widget//
          PersonDetailTable(
            onTap: () {
              // profilePic.imagepickerfun();
            },
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
                  const DetailTile(
                    keyboardType: TextInputType.number,
                    // controllers: controller.phoneController,
                    sub: 'Phone number',
                    hittext: 'Enter your phone number',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DetailTile(
                    keyboardType: TextInputType.emailAddress,
                    // controllers: controller.emailContorllers,
                    sub: 'Email',
                    hittext: 'Enter your email address',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DetailTile(
                    // controllers: controller.genderController,
                    sub: 'Gender',
                    hittext: "",
                    // suffixicon: DropdownButton(
                    //   icon: const Icon(Icons.arrow_drop_down),
                    //   iconDisabledColor:
                    //       const Color.fromARGB(252, 103, 103, 103),
                    //   items: controller.selectRepeatList
                    //       .map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value.toString(),
                    //       child: Text(value.toString()),
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     controller.selectGetnder(newValue);
                    //   },
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DetailTile(
                    // controllers: controller.birthController,
                    sub: 'Birthday',
                    hittext: "",
                    suffixicon: IconButton(
                        onPressed: () {
                          // controller.getTimeFromUser(context);
                        },
                        icon: const Icon(Icons.calendar_month)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DetailTile(
                    keyboardType: TextInputType.number,
                    //controllers: controller.expController,
                    sub: 'Address',
                    hittext: 'Enter your Address',
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Appcolor.primaryColor,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
