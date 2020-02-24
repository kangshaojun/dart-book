import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '可选命名参数示例',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('可选命名参数示例'),
        ),
        //容器组件
        body: Container(
          //内边距属性 left right top bottom为可选参数
          padding: EdgeInsets.only(
            //左内边距值
            left: 20,
            //右内边距值
            right: 20,
            //上内边距值
            top: 30,
            //下内边距值
            bottom: 30,
          ),
          //文本组件
          child: Text(
            '可选参数',
            //文本样式 color fontSize为可选参数
            style: TextStyle(
              //字体颜色
              color: Colors.red,
              //字体大小
              fontSize: 18.0,
            ),
          ),
        )
    );
  }
}
