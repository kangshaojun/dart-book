//导入material.dart后不必导入meta.dart
//import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '@required参数示例',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('@required参数示例'),
        ),
        //动画容器组件
        body: AnimatedContainer(
          //可选参数
          margin: EdgeInsets.only(left: 10.0),
          //duration为必传参数 不传会报异常
          duration: Duration(seconds: 2),
          //可选参数
          width: 40.0,
          //可选参数
          height: 50,
          //可选参数
          color: Colors.yellow,
        ),
    );
  }
}
