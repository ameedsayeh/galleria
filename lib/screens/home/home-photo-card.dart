import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/models/photo.dart';
import 'package:galleria/screens/details/photo-details-screen.dart';
import 'package:galleria/services/photos-service.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePhotoCard extends StatefulWidget {
  final Photo photo;

  const HomePhotoCard({Key key, this.photo}) : super(key: key);

  @override
  _HomePhotoCardState createState() => _HomePhotoCardState();
}

class _HomePhotoCardState extends State<HomePhotoCard>
    with SingleTickerProviderStateMixin {
  void updateState(bool isFav) {
    setState(() {
      widget.photo.isFavourite = isFav;
    });
  }

  @override
  initState() {
    super.initState();

    PhotosService.shared.isFavourite(widget.photo).then((value) {
      setState(() {
        widget.photo.isFavourite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          widget.photo.isFavourite = !widget.photo.isFavourite;

          if (widget.photo.isFavourite) {
            PhotosService.shared.addToFavourite(widget.photo);
          } else {
            PhotosService.shared.removeFromFavourite(widget.photo);
          }
        });
      },
      onTap: () {
        print(widget.photo.isFavourite);
        Get.to(PhotoDetailsScreen(
          photo: widget.photo,
          updateState: this.updateState,
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Hero(
              tag: "photo.${widget.photo.id}",
              child: CachedNetworkImage(
                imageUrl: widget.photo.getThumbnailURL(),
                placeholder: (context, url) => LottieBuilder.asset(
                    'assets/animations/image_placeholder.json'),
                fadeInDuration: Duration(),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                alignment: Alignment.center,
                color: ColorPallete.colors['transparentBox'],
                child: AnimatedSize(
                  vsync: this,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    Icons.favorite,
                    color: widget.photo.isFavourite
                        ? ColorPallete.colors['primaryColor']
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
