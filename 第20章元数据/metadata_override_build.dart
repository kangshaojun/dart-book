//metadata_override_build.dart文件
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//MyApp组件继承一个没有状态的组件
class MyApp extends StatelessWidget {

  //重写build方法重新渲染组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '方法重写示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('方法重写示例'),
        ),
        body: Center(
          child: Text('override build'),
        ),
      ),
    );
  }
}