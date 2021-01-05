import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galleria/models/photo.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final Photo photo;
  final ImageProvider imageProvider;

  const PhotoViewer({Key key, this.photo, this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            heroAttributes: PhotoViewHeroAttributes(tag: "photo.${photo.id}"),
            minScale: calcMinScale(context),
            initialScale: calcMinScale(context),
            imageProvider: imageProvider,
          ),
          Positioned(
            top: 16,
            left: 32,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calcMinScale(BuildContext context) {
    var widthScale = MediaQuery.of(context).size.width / photo.width;
    var heightScale = MediaQuery.of(context).size.height / photo.height;

    return min(widthScale, heightScale);
  }
}
