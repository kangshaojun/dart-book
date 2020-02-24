//extends_override_build_method.dart文件
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//MyApp类继承StatelessWidget类
class MyApp extends StatelessWidget {

  //重写StatelessWidget的build方法
  @override
  Widget build(BuildContext context) {
    //返回一个Widget
    return MaterialApp(
      title: 'build方法重写示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('build方法重写示例'),
        ),
        body: Center(
          child: Text('override build'),
        ),
      ),
    );
  }
}