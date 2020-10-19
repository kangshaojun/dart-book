//lib/main.dart文件
import 'package:flutter/material.dart';

//入口程序
void main() => runApp(MyApp());

//主组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart语言',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Web开发'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

