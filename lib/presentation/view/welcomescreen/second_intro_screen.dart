import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doc2heal/presentation/view/login_screen.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SecondIntroScreen extends StatelessWidget {
  const SecondIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.lightbackground,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 30),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
          backgroundColor: Appcolor.primaryColor,
          label: Text('Continue'),
          icon: const Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/Online Doctor-amico.png"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "We provide    professional doctors services for you",
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.highboldTxtStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .20,
              child: Column(
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Continue and join now',
                        textStyle: CustomTextStyle.swipeTextStyle,
                        speed: const Duration(milliseconds: 90),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 1000),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
