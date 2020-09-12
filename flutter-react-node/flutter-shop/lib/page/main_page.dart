//page/main_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/home/home_page.dart';
import 'package:flutter_shop/page/category/category_page.dart';
import 'package:flutter_shop/page/cart/cart_page.dart';
import 'package:flutter_shop/page/user/member_page.dart';
import 'package:flutter_shop/config/index.dart';
//主界面
class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  {
  //当前索引
  int _currentIndex = 0;
  //主要界面选项卡
  List<BottomNavigationBarItem> _tabs = [
    //首页
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.HOME_TITLE),
    ),
    //分类
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.CATEGORY_TITLE),
    ),
    //购物车
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.CART_TITLE),
    ),
    //会员中心
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.MENMBER_TITLE),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //屏幕适配初始化,提供一个参考宽高值
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    return Scaffold(
      //底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //当前索引
        currentIndex: _currentIndex,
        //选项卡
        items: _tabs,
        //点击处理
        onTap: (index){
          //设置当前索引
          this.setState(() {
            _currentIndex = index;
          });
        },
      ),
      //带索引的层叠组件
      body: IndexedStack(
        //当前索引
        index: _currentIndex,
        children:[
          HomePage(),
          CategoryPage(),
          CartPage(),
          MemberPage()
        ],
      ),
    );
  }

}