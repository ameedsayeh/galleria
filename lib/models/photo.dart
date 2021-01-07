class Photo {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String download_url;
  bool isFavourite = false;

  Photo({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.download_url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      author: json['author'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      download_url: json['download_url'],
    );
  }

  String getVerticalThumbnailURL() {
    return "https://picsum.photos/id/$id/400/600";
  }

  String getHorizontalThumbnailURL() {
    return "https://picsum.photos/id/$id/600/400";
  }
}
