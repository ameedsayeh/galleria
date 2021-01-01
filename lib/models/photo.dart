class Photo {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadURL;

  Photo({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadURL,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      author: json['author'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      downloadURL: json['download_url'],
    );
  }

  String getThumbnailURL() {
    return "https://picsum.photos/id/$id/400/600";
  }
}
