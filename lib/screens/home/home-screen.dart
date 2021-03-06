import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/screens/favourite/favourite-screen.dart';
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
            padding: EdgeInsets.all(16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {
                Get.offAll(
                  FavouriteScreen(),
                );
              },
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
