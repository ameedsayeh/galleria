import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/models/photo.dart';
import 'package:galleria/screens/details/photo-details-screen.dart';
import 'package:galleria/services/photos-service.dart';
import 'package:get/get.dart';

import 'favourite-photo-card.dart';

class FavouriteGalleryList extends StatefulWidget {
  @override
  _FavouriteGalleryListState createState() => _FavouriteGalleryListState();
}

class _FavouriteGalleryListState extends State<FavouriteGalleryList> {
  Future<List<Photo>> favouritePhotosFuture;
  List<Photo> favouritePhotosList;

  @override
  void initState() {
    super.initState();

    this.favouritePhotosFuture = PhotosService.shared.getFavouriteList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: favouritePhotosFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          favouritePhotosList = snapshot.data;
          return renderListView();
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation(ColorPallete.colors['loadingIndicator']),
          );
        }
      },
    );
  }

  void filterList() {
    this.favouritePhotosList.removeWhere((element) => !element.isFavourite);
  }

  Widget renderListView() {
    if (this.favouritePhotosList.length == 0) {
      return Center(
        child: Text("noFavourite".tr),
      );
    }
    return ListView(
      children: this
          .favouritePhotosList
          .map((e) => GestureDetector(
                onTap: () {
                  Get.to(PhotoDetailsScreen(
                    photo: e,
                    updateState: (state) {
                      e.isFavourite = 
                    },
                  ));
                },
                child: FavouritePhotoCard(
                  photo: e,
                  parentUpdate: (newState) {
                    e.isFavourite = newState;

                    setState(() {});
                  },
                ),
              ))
          .toList(),
    );
  }
}
