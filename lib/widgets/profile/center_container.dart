import 'package:doc2heal/presentation/view/profile/privecy_policy_screen.dart';
import 'package:doc2heal/presentation/view/profile/profile_screen.dart';
import 'package:doc2heal/presentation/view/profile/terms_contition_screen.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1.5,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ],
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between children
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.person_3,
                          color: Colors.black,
                          size: 25,
                        ),
                      ), // Start icon
                      const Padding(
                        padding: EdgeInsets.only(right: 90),
                        child: Text('Your Profile',
                            style: CustomTextStyle.buttonTextStyle),
                      ), // Centered text
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                            size: 16), // End icon button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between children
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.privacy_tip_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ), // St/ Start icon
                      const Padding(
                        padding: EdgeInsets.only(right: 60),
                        child: Text('Privacy & policy',
                            style: CustomTextStyle.buttonTextStyle),
                      ), // Centered text
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                        ), // End icon button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ));
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Space between children
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.description_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ), // St Start icon
                      const Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Text('Terms & conditon',
                            style: CustomTextStyle.buttonTextStyle),
                      ), //
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                            size: 16), // End icon button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const TermsAndConditionsScreen(),
                          ));
                          print('IconButton pressed');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}
