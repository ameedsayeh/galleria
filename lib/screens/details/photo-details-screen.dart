import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/globals/text-styler.dart';
import 'package:galleria/models/photo.dart';
import 'package:galleria/screens/details/photo-clipper.dart';
import 'package:galleria/screens/details/photo-viewer.dart';
import 'package:galleria/screens/details/photo-webview-screen.dart';
import 'package:galleria/services/photos-service.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class PhotoDetailsScreen extends StatefulWidget {
  final Photo photo;
  final ValueChanged<bool> updateState;

  PhotoDetailsScreen({Key key, this.photo, this.updateState}) : super(key: key);

  @override
  _PhotoDetailsScreenState createState() => _PhotoDetailsScreenState();
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
  var imageProvider;

  Widget renderFavouriteButton() {
    return Padding(
      padding: EdgeInsets.only(left: 32.0, right: 32.0),
      child: FlatButton(
        color: widget.photo.isFavourite
            ? ColorPallete.colors['greyAction']
            : ColorPallete.colors['primaryColor'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: widget.photo.isFavourite
                ? ColorPallete.colors['greyAction']
                : ColorPallete.colors['primaryColor'],
            width: 1.5,
          ),
        ),
        onPressed: () {
          if (!widget.photo.isFavourite) {
            PhotosService.shared.addToFavourite(widget.photo);
            Get.snackbar(
              'photoOf'.tr + ' ${widget.photo.author}',
              'addedToFavorite'.tr,
              backgroundColor: Colors.white,
            );
          } else {
            PhotosService.shared.removeFromFavourite(widget.photo);
            Get.snackbar(
              'photoOf'.tr + ' ${widget.photo.author}',
              'removedFromFavorite'.tr,
              backgroundColor: Colors.white,
            );
          }
          setState(() {
            widget.photo.isFavourite = !widget.photo.isFavourite;
          });

          widget.updateState(widget.photo.isFavourite);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.photo.isFavourite
                  ? 'removeFromFavorite'.tr
                  : 'addToFavorite'.tr,
              style: TextStyler.whiteTextStyle,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              widget.photo.isFavourite ? Icons.delete : Icons.favorite,
              color: ColorPallete.colors['whiteAction'],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderVisitButton() {
    return Padding(
      padding: EdgeInsets.only(left: 32.0, right: 32.0),
      child: FlatButton(
        color: ColorPallete.colors['hyperText'],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: ColorPallete.colors['hyperText'],
            width: 1.5,
          ),
        ),
        onPressed: () {
          Get.to(
            PhotoWebView(
              photo: widget.photo,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'site'.tr,
              style: TextStyler.whiteTextStyle,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.public,
              color: ColorPallete.colors['whiteAction'],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height * 2 / 5,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "photo.${widget.photo.id}",
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      PhotoViewer(
                        photo: widget.photo,
                        imageProvider: imageProvider,
                      ),
                    );
                  },
                  child: ClipPath(
                    clipper: PhotoClipper(),
                    child: CachedNetworkImage(
                      imageUrl: widget.photo.downloadURL,
                      placeholder: (context, url) => LottieBuilder.asset(
                          'assets/animations/image_placeholder.json'),
                      imageBuilder: (context, imageProvider) {
                        this.imageProvider = imageProvider;

                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          renderPhotoDetails(),
        ],
      ),
    );
  }

  Widget renderPhotoDetails() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ListTile(
            title: Text(
              "author".tr,
              style: TextStyler.titleTextStyle,
            ),
            subtitle: Text(
              widget.photo.author,
              style: TextStyler.subTextStyle,
            ),
          ),
          ListTile(
            title: Text(
              "dimensions".tr,
              style: TextStyler.titleTextStyle,
            ),
            subtitle: Text(
              "${widget.photo.width} X ${widget.photo.height}",
              style: TextStyler.subTextStyle,
            ),
          ),
          renderVisitButton(),
          renderFavouriteButton(),
        ],
      ),
    );
  }
}
