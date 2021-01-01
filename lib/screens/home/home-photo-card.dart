import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galleria/models/photo.dart';
import 'package:lottie/lottie.dart';

class HomePhotoCard extends StatelessWidget {
  final Photo photo;

  const HomePhotoCard({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        imageUrl: photo.getThumbnailURL(),
        placeholder: (context, url) =>
            LottieBuilder.asset('assets/animations/image_placeholder.json'),
        fadeInDuration: Duration(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
