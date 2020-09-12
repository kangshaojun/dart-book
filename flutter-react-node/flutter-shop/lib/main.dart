//main.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/main_page.dart';
//程序入口
void main() {
  runApp(MyApp());
}

//根组件
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Material风格应用
    return MaterialApp(
      //标题
      title: KString.MAIN_TITLE,
      debugShowCheckedModeBanner: false,
      //定制主题
      theme: ThemeData(
        primaryColor: KColor.PRIMARY_COLOR,
      ),
      //主页
      home: MainPage(),
    );
  }
}
