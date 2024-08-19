import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Newsdetails extends StatelessWidget {
   Newsdetails({super.key,required  this.author,required this.link});
   String author;
   String link;

  @override
  Widget build(BuildContext context) {
    late WebViewController controller;
    controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setBackgroundColor(Colors.white);
    controller.loadRequest(Uri.parse(link));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title:  Text(author,style: TextStyle(color: Colors.black),),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
