//router/router_handlers.dart文件
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shop/page/home/index_page.dart';
import 'package:shop/page/loading/loading_page.dart';
import 'package:shop/page/goods/goods_category_page.dart';
import 'package:shop/page/login/register_page.dart';
import 'package:shop/page/login/login_page.dart';
import 'package:shop/utils/string_util.dart';
import 'package:shop/page/goods/goods_detail_page.dart';
import 'package:shop/page/order/fill_in_order_page.dart';
import 'package:shop/page/mine/address_page.dart';
import 'package:shop/page/mine/address_edit_page.dart';
import 'package:shop/page/mine/collect_page.dart';
import 'package:shop/page/mine/about_us_page.dart';
import 'package:shop/page/order/order_page.dart';
import 'package:shop/page/order/order_detail_page.dart';
import 'package:shop/widgets/webview_widget.dart';
import 'package:shop/utils/fluro_convert_util.dart';

//首页
var homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return IndexPage();
});

//加载页
var loadingHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoadingPage();
});

//商品列表
var categoryGoodsListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  //分类名称
  var cateforyName = StringUtil.decode(parameters["categoryName"].first).toString();
  print("cateforyName" + cateforyName);
  print("categoryId" + parameters["categoryId"].first);
  //分类Id
  var categoryId = int.parse(parameters["categoryId"].first);
  return GoodsCategoryPage(categoryName: cateforyName, categoryId: categoryId);
});

//注册
var registerHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return RegisterPage();
});

//登录
var loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginPage();
});

//商品详情
var goodsDetailsHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  //商品Id
  var goodsId = int.parse(parameters["goodsId"].first);
  return GoodsDetailPage(goodsId: goodsId);
});

//填写订单
var fillInOrderHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  //购物车Id
  var cartId = int.parse(parameters["cartId"].first);
  return FillInOrderPage(cartId);
});

//地址
var addressHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return AddressPage();
});

//地址修改
var addressEditHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  //地址Id
  var addressId = int.parse(parameters["addressId"].first);
  return AddressEditPage(addressId);
});

//收藏
var collectHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CollectPage();
});

//关于我们
var aboutHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return AboutUsPage();
});

//订单
var orderHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return OrderPage();
});

//订单详情
var orderDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  //订单Id
  int orderId = int.parse(parameters["orderId"].first);
  //token值
  String token = parameters["token"].first;
  return OrderDetailPage(orderId, token);
});

//网页加载
var webViewHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  //标题
  var title = FluroConvertUtil.fluroCnParamsDecode(parameters["title"].first);
  //路径
  var url = FluroConvertUtil.fluroCnParamsDecode(parameters["url"].first);
  return WebViewWidget(url, title);
});

