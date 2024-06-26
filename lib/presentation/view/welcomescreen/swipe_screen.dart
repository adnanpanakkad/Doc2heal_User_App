import 'package:doc2heal/presentation/view/welcomescreen/first_intro_screen.dart';
import 'package:doc2heal/presentation/view/welcomescreen/second_intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              FirstIntroScreen(),
              SecondIntroScreen(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.96),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.thin,
                    activeDotColor: Color.fromARGB(255, 55, 55, 55),
                    dotColor: Color.fromARGB(153, 93, 93, 93)),
              )),
        ],
      ),
    );
  }
}
