import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
class Utils {

  static String getTables(List list) {
    String tables = '';
    for (var element in list) {

      tables = '${element.number},$tables';
    }
    return tables;
  }

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hidePopup() {
    Get.back();
  }


  static void showSnackBar(String message) {
    Get.snackbar(
      "Information!",
      message,
      icon: Icon(Icons.error, color: Colors.indigo),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.lightBlue,
      borderRadius: 20,
      margin: EdgeInsets.only(right: 700),
      colorText: white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
    );
  }


}