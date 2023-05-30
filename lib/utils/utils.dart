import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static void flushErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: const Color.fromARGB(255, 165, 155, 155),
        duration: const Duration(seconds: 2),
      )..show(context),
    );
  }

  static snackBar(String message, Color? color, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: color,
        content: Text(message),
      ),
    );
  }
  // final snackBar = SnackBar(
  //   content: const Text('Hi, I am a SnackBar!'),
  //   backgroundColor: (Colors.black12),
  //   action: SnackBarAction(
  //     label: 'dismiss',
  //     onPressed: () {},
  //   ),
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
