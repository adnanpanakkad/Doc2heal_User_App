import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.lightbackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Doctors-amico.png"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Lets make your  day great  right now',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.highboldTxtStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .20,
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Swipe and Continue...',
                    textStyle: CustomTextStyle.swipeTextStyle,
                    speed: const Duration(milliseconds: 90),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 1000),
              ),
            )
          ],
        ),
      ),
    );
  }
}
