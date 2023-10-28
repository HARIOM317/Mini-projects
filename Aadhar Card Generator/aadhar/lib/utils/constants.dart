import 'package:flutter/material.dart';

Color primaryColor = Colors.blue;
Color secondaryColor = Colors.lightBlue;
Color bgColor = Colors.white;

// function to show snackbar
void showSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: const TextStyle(fontSize: 16),
      ),
      backgroundColor: Colors.green[500],
      behavior: SnackBarBehavior.floating));
}

//  function to switch page
void goTo(BuildContext context, Widget nextScreen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
}