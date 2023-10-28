import 'package:aadhar/utils/constants.dart';
import 'package:aadhar/utils/custom_material_color.dart';
import 'package:aadhar/widget/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // stop auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Set default status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: primaryColor));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aadhar Generator',
      theme: ThemeData(
        primarySwatch: createMaterialColor(primaryColor),
        scaffoldBackgroundColor: bgColor
      ),
      home: const SplashScreen(),
    );
  }
}
