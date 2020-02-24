//metadata_required.dart文件
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//主组件
class MyApp extends StatelessWidget {

  //重写build方法
  @override
  Widget build(BuildContext context) {

    //定义参数变量
    final appName = '必传参数示例';

    return MaterialApp(
      //应用标题
      title: appName,
      //首页
      home: MyHomePage(
        //传入title参数
        title: appName,
      ),
    );
  }
}
//首页
class MyHomePage extends StatelessWidget {
  //标题
  final String title;
  //key是可选择参数,key为widget的唯一标识 title为标题是必传参数
  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //首页标题
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Text(
            //必传参数值
            this.title,
            //文本样式
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}
