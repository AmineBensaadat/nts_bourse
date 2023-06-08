import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:nts_bourse_app/screens/login.dart';
import 'package:page_transition/page_transition.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Flexible(
            flex: 2,
            child: Image.asset('assets/images/Fichier102.png'),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 2,
            child: Image.asset('assets/images/Loading_icon.gif'),
          ),
        ],
      ),
      splashIconSize: 200,
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: const Duration(seconds: 1),
      duration: 2000,
    );
  }
}
