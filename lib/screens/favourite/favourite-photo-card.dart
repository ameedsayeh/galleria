import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galleria/models/photo.dart';
import 'package:galleria/screens/details/photo-details-screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavouritePhotoCard extends StatelessWidget {
  final Photo photo;
  final ValueChanged<bool> parentUpdate;

  const FavouritePhotoCard({Key key, this.photo, this.parentUpdate})
      : super(key: key);

  void updateState(bool state) {
    this.photo.isFavourite = state;

    this.parentUpdate(state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Hero(
          tag: "photo.${photo.id}",
          child: GestureDetector(
            onTap: () {
              Get.to(PhotoDetailsScreen(
                photo: photo,
                updateState: this.updateState,
              ));
            },
            child: CachedNetworkImage(
              imageUrl: photo.getVerticalThumbnailURL(),
              placeholder: (context, url) => LottieBuilder.asset(
                  'assets/animations/image_placeholder.json'),
              fadeInDuration: Duration(),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
