import 'package:aadhar/utils/constants.dart';
import 'package:aadhar/widget/get_details.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/icons/logo.png',
      nextScreen: const GetDetailsPage1(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: bgColor,
      splashIconSize: 200,
      duration: 2500,
    );
  }
}