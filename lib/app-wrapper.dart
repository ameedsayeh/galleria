import 'package:flutter/material.dart';
import 'package:galleria/screens/home-screen.dart';

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Galleria",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
