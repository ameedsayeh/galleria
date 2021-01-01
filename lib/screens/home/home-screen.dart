import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/screens/home/gallery-grid.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.colors['appBar'],
        title: Text("homeScreenTitle".tr),
      ),
      body: GalleryGrid(),
    );
  }
}
