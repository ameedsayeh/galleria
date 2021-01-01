import 'package:flutter/material.dart';
import 'package:galleria/globals/dictionary/dictionary.dart';
import 'package:galleria/screens/home/home-screen.dart';
import 'package:get/get.dart';

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Galleria",
      home: HomeScreen(),
      translations: Dictionary(),
      fallbackLocale: Locale('en'),
      debugShowCheckedModeBanner: false,
    );
  }
}
