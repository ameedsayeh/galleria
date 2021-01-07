import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/screens/home/home-screen.dart';
import 'package:get/get.dart';

import 'favourite-gallery-list.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPallete.colors['appBar'],
        title: Text("favouriteScreenTitle".tr),
        actions: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () {
                Get.offAll(
                  HomeScreen(),
                );
              },
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: FavouriteGalleryList(),
    );
  }
}
