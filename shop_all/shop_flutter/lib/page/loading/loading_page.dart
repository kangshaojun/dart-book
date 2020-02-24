//page/loading/loading_page.dart文件
import 'package:flutter/material.dart';
import 'package:shop/utils/navigator_util.dart';

//加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //延迟3秒执行
    Future.delayed(Duration(seconds: 3), () {
      //跳转至应用首页
      NavigatorUtil.goShopMainPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        //添加加载图片即广告图
        child: Image.asset(
          "images/loading.png",
          width: double.infinity,
          height: double.infinity,
          //指定填充模式
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
