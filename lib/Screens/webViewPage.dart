import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewPage extends StatefulWidget {
  var URL;
  webViewPage({required this.URL});
  @override
  State<webViewPage> createState() => _webViewPageState();
}

class _webViewPageState extends State<webViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.URL,
    );
  }
}
