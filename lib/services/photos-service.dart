import 'dart:convert';

import 'package:galleria/models/photo.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class PhotosService {
  static final PhotosService shared = PhotosService._privateConstructor();

  PhotosService._privateConstructor();

  String _apiURL = "https://picsum.photos/v2/list";
  Database database;

  Future<List<Photo>> fetchPhotos(page) async {
    final response = await http.get(this._apiURL + "?page=$page");

    if (response.statusCode == 200) {
      Iterable photoListIter = json.decode(response.body);
      return List<Photo>.from(photoListIter.map((obj) => Photo.fromJson(obj)));
    } else {
      throw Exception('Error in loading images');
    }
  }

  Future<Database> initDatabase() async {
    this.database = await openDatabase('photos.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE fav_photo (id TEXT PRIMARY KEY, width INTEGER, height INTEGER, author TEXT, url TEXT, download_url TEXT)');
    });

    return this.database;
  }

  void addToFavourite(Photo photo) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO fav_photo(id, width, height, author, url, download_url) VALUES('${photo.id}', ${photo.width}, ${photo.height}, '${photo.author}', '${photo.url}', '${photo.download_url}')");
    });
  }

  void removeFromFavourite(Photo photo) async {
    await database.transaction((txn) async {
      await txn.rawInsert("DELETE FROM fav_photo WHERE id='${photo.id}'");
    });
  }

  Future<bool> isFavourite(Photo photo) async {
    List<Map> list = await database
        .rawQuery("SELECT * FROM fav_photo WHERE id='${photo.id}'");
    if (list.length > 0) {
      return true;
    }
    return false;
  }

  Future<List<Photo>> getFavouriteList() async {
    List<Map> list = await database.rawQuery('SELECT * FROM fav_photo');

    return list.map((e) {
      var photo = Photo.fromJson(e);
      photo.isFavourite = true;
      return photo;
    }).toList();
  }
}
