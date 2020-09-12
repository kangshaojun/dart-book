//utils/router_util.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/category/category_good_list_page.dart';
import 'package:flutter_shop/page/detail/good_detail_page.dart';
import 'package:flutter_shop/page/user/login_page.dart';
import 'package:flutter_shop/page/user/register_page.dart';
import 'package:flutter_shop/page/user/member_page.dart';
import 'package:flutter_shop/page/cart/cart_page.dart';
import 'package:flutter_shop/page/order/write_order_page.dart';
import 'package:flutter_shop/page/order/order_list_page.dart';
import 'package:flutter_shop/page/order/order_info_page.dart';
import 'package:flutter_shop/model/order_model.dart';
//路由处理工具
class RouterUtil{
  //路由至分类商品列表页面 需要传入一级和二级分类Id
  static toCategoryGoodListPage(BuildContext context,int _firstCategoryId,int _secondCategoryId){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryGoodListPage(_firstCategoryId,_secondCategoryId),
        ));
  }
  //路由至登录页面
  static toLoginPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }
  //路由至注册页面
  static toRegisterPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ));
  }
  //路由至会员中心页面
  static toMemberPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MemberPage(),
        ));
  }
  //路由至商品详情页面 传入商品Id参数
  static toGoodDetailPage(BuildContext context,String goodId){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GoodDetailPage(goodId),
        ));
  }
  //路由至购物车页面
  static toCartPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartPage(),
        ));
  }
  //路由至填写订单页面
  static toWriteOrderPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WriteOrderPage(),
        ));
  }
  //路由至订单列表页面
  static toOrderListPage(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderListPage(),
        ));
  }
  //路由至订单详情页面 传入订单数据
  static toOrderInfoPage(BuildContext context,OrderModel orderModel){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderInfoPage(orderModel),
        ));
  }
  //返回至上一个页面
  static pop(BuildContext context){
    Navigator.pop(context);
  }
}