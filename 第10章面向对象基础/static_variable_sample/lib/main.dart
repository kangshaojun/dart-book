//static_variable_sample/lib/main.dart文件
import 'package:flutter/material.dart';
//导入KString类
import 'string.dart';
//入口程序
void main() {
  runApp(
    MaterialApp(
      title: '静态变量使用示例',
      home: MyApp(),
    ),
  );
}
//主组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //主标题
          title: Text(KString.mainTitle),
        ),
        //居中组件
        body: Center(
          //首页
          child: Text(KString.homeTitle,
            //字体大小也可以提取成静态变量
            style: TextStyle(fontSize: 28.0),
          ),
        )
    );
  }
}
