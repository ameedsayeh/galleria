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
        actions: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {},
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: GalleryGrid(),
    );
  }
}
