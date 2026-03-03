import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class CustomSnackBar {
  snackbar(BuildContext context, String title) {
    Flushbar(
      message: title,
      duration: const Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(255, 5, 11, 84),
      animationDuration: const Duration(milliseconds: 2000),

      flushbarPosition: FlushbarPosition.TOP,

      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(12),
      icon: const Icon(Icons.check_circle, color: Colors.green),
    ).show(context);
  }

  showSnackbar(String message, {bool isError = false}) {
    Get.snackbar(
      "", // no title
      message,
      snackPosition: SnackPosition.top,
      backgroundColor: isError
          ? Colors.redAccent
          : const Color.fromARGB(255, 5, 11, 84),
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 12,
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: isError ? Colors.white : Colors.greenAccent,
      ),
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 500),
      snackStyle: SnackStyle.floating,
      isDismissible: true,
    );
  }
}
