import 'package:IcarePro/BottomNavBar/bottomNav.dart';
import 'package:IcarePro/login/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splashscreen extends StatefulWidget {
  bool loginState;
  Splashscreen({required this.loginState, super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: AnimatedTextKit(
              onFinished: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (widget.loginState == true)
                          ? const BottomNav()
                          : LoginPage(),
                    ));
              },
              animatedTexts: [
                TypewriterAnimatedText(
                  'Hi...',
                  cursor: ".",
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  speed: const Duration(milliseconds: 110),
                ),
                TypewriterAnimatedText('Welcome to IcarePro',
                    textAlign: TextAlign.center,
                    curve: Curves.ease,
                    textStyle: const TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 120),
                    cursor: "!"),
                TypewriterAnimatedText(
                  'A Medical Service System!',
                  textAlign: TextAlign.center,
                  curve: Curves.ease,
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  speed: const Duration(milliseconds: 120),
                  cursor: "!",
                ),
              ],
              isRepeatingAnimation: false,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          )
        ],
      ),
    );
  }
}
