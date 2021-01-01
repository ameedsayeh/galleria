import 'package:flutter/material.dart';
import 'package:galleria/app-wrapper.dart';
import 'package:get/get.dart';

void main() async {
  Get.updateLocale(Get.deviceLocale);

  runApp(
    AppWrapper(),
  );
}
