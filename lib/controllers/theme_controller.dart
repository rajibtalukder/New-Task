import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void changeTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? ThemeData.dark() : ThemeData.light());
  }
}
