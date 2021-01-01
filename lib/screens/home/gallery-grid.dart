import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/models/photo.dart';
import 'package:galleria/screens/home/home-photo-card.dart';
import 'package:galleria/services/photos-service.dart';

class GalleryGrid extends StatefulWidget {
  @override
  _GalleryGridState createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  List<Photo> photoList = [];
  Future<List<Photo>> photoListFuture;
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    fetchPage();
  }

  void fetchPage() {
    if (page == 1) {
      photoListFuture = PhotosService.shared.fetchPhotos(page);
    } else {
      PhotosService.shared.fetchPhotos(page).then((value) {
        isLoading = false;
        photoList.addAll(value);
      });
    }
  }

  List<Widget> renderPhotos(List<Photo> photos) {
    return photos
        .map((photo) => HomePhotoCard(
              photo: photo,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: Center(
        child: FutureBuilder<List<Photo>>(
          future: photoListFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              photoList = snapshot.data;

              return NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification.metrics.pixels ==
                          scrollNotification.metrics.maxScrollExtent &&
                      !isLoading) {
                    isLoading = true;
                    setState(() {
                      page += 1;
                      print("HELLO!!!!");
                      fetchPage();
                    });
                  }
                },
                child: GridView.count(
                  padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2 / 3,
                  children: renderPhotos(photoList),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                    ColorPallete.colors['loadingIndicator']),
              );
            }
          },
        ),
      ),
    );
  }
}
