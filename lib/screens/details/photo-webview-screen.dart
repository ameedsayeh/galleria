import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';
import 'package:galleria/models/photo.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PhotoWebView extends StatefulWidget {
  final Photo photo;

  const PhotoWebView({Key key, this.photo}) : super(key: key);

  @override
  _PhotoWebViewState createState() => _PhotoWebViewState(photo);
}

class _PhotoWebViewState extends State<PhotoWebView> {
  final Photo photo;

  Completer<WebViewController> _controller = Completer<WebViewController>();

  _PhotoWebViewState(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${photo.author}'s photo"),
        backgroundColor: ColorPallete.colors['appBar'],
      ),
      body: WebView(
        initialUrl: photo.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          print("HERE!");
          controller.loadUrl(photo.url);
        },
      ),
    );
  }
}
