//widgets/webview_widget.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//网页加载组件
class WebViewWidget extends StatelessWidget {
  //路径
  var url;
  //标题
  var title;
  //构造方法
  WebViewWidget(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //显示网页标题
        title: Text(title),
        centerTitle: true,
      ),
      //使用WebviewScaffold加载网页
      body: WebviewScaffold(
        url: url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}
