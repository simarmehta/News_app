
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget {

late final String newsUrl;
ArticleScreen({required this.newsUrl});

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> completer
  = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blueAccent,
        title:
            Text(" News",),


        ),

      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: (WebViewController webViewController){
            completer.complete(webViewController);
          },


        ),

      ),
    );

  }
  }

