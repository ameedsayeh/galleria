import 'dart:convert';

import 'package:galleria/models/photo.dart';
import 'package:http/http.dart' as http;

class PhotosService {
  static final PhotosService shared = PhotosService._privateConstructor();

  PhotosService._privateConstructor();

  String _apiURL = "https://picsum.photos/v2/list";

  Future<List<Photo>> fetchPhotos(page) async {
    final response = await http.get(this._apiURL + "?page=$page");

    if (response.statusCode == 200) {
      Iterable photoListIter = json.decode(response.body);
      return List<Photo>.from(photoListIter.map((obj) => Photo.fromJson(obj)));
    } else {
      throw Exception('Error in loading images');
    }
  }
}
