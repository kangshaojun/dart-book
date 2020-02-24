//static_method_sample/theme/lib/main.dart文件
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("静态方法示例"),
      ),
      body: Center(
        child: Container(
          //使用静态方法Theme.of获取主题的accentColor
          color: Theme.of(context).accentColor,
          child: Text(
            '带有背景颜色的文本组件',
            //使用静态方法Theme.of获取主题的文本样式
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
