//utils/navigatr_util.dart文件
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shop/router/application.dart';
import 'package:shop/router/routers.dart';
import 'package:shop/utils/string_util.dart';
import 'package:shop/utils/fluro_convert_util.dart';
//导航工具提供静态方法简化路由处理代码
class NavigatorUtil {
  //跳转至首页
  static goShopMainPage(BuildContext context) {
    Application.router.navigateTo(
        context,
        Routers.home,
        transition: TransitionType.inFromRight, replace: true);
  }
  //跳转至商品列表页面
  static goCategoryGoodsListPage(BuildContext context, String categoryName, int categoryId) {
    //Json编码处理
    var categoryNameText = StringUtil.encode(categoryName);
    //传递参数为分类Id及分类名称
    Application.router.navigateTo(
        context,
        Routers.categoryGoodsList + "?categoryName=$categoryNameText&categoryId=$categoryId",
        transition: TransitionType.inFromRight);
  }
  //跳转至注册页面
  static goRegister(BuildContext context) {
    Application.router.navigateTo(context, Routers.register,
        transition: TransitionType.inFromRight);
  }
  //跳转至登录页面
  static goLogin(BuildContext context) {
    Application.router.navigateTo(context, Routers.login,
        transition: TransitionType.inFromRight);
  }
  //跳转至商品详情页面
  static goGoodsDetails(BuildContext context, int goodsId) {
    //传递参数为商品Id
    Application.router.navigateTo(
        context, Routers.goodsDetail + "?goodsId=$goodsId",
        transition: TransitionType.inFromRight);
  }
  //返回注册页面
  static popRegister(BuildContext context) {
    Application.router.pop(context);
  }
  //跳转至填写订单页面
  static goFillInOrder(BuildContext context,int cartId) {
    //参数为购物车Id
    Application.router.navigateTo(
        context,
        Routers.fillInOrder+"?cartId=$cartId",
        transition: TransitionType.inFromRight);
  }
  //跳转至地址页面
  static Future goAddress(BuildContext context) {
    return Application.router.navigateTo(context, Routers.address,
        transition: TransitionType.inFromRight);
  }

  //跳转至地址编辑页面
  static Future goAddressEdit(BuildContext context, int addressId) {
    //参数为地址Id
    return Application.router.navigateTo(
        context,
        Routers.addressEdit + "?addressId=$addressId",
        transition: TransitionType.inFromRight);
  }
  //跳转至收藏页面
  static goCollect(BuildContext context) {
    Application.router.navigateTo(context, Routers.mineCollect,
        transition: TransitionType.inFromRight);
  }
  //跳转至关于我们页面
  static goAboutUs(BuildContext context) {
    Application.router.navigateTo(context, Routers.aboutUs,
        transition: TransitionType.inFromRight);
  }
  //跳转至订单页面
  static goOrder(BuildContext context) {
    Application.router.navigateTo(context, Routers.mineOrder,
        transition: TransitionType.inFromRight);
  }
  //跳转至订单详情页面
  static Future goOrderDetail(BuildContext context, int orderId, String token) {
    //参数有订单Id及token
    return Application.router.navigateTo(
        context, Routers.mineOrderDetail + "?orderId=$orderId&token=$token",
        transition: TransitionType.inFromRight);
  }
  //跳转至网页页面
  static goWebView(BuildContext context, String title, String url) {
    //中文参数处理
    var titleName = FluroConvertUtil.fluroCnParamsEncode(title);
    var urlEncode = FluroConvertUtil.fluroCnParamsEncode(url);
    Application.router.navigateTo(
        context, Routers.webView + "?title=$titleName&&url=$urlEncode",
        transition: TransitionType.inFromRight);
  }
  //跳转至轮播图详情页面
  static goBrandDetail(BuildContext context, String titleName, int id) {
    var title = FluroConvertUtil.fluroCnParamsEncode(titleName);
    Application.router.navigateTo(
        context, Routers.brandDetail + "?titleName=$title&id=$id",
        transition: TransitionType.inFromRight);
  }
}
