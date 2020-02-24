//service/cart_service.dart文件
import 'package:dio/dio.dart';
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/server_url.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/cart_list_model.dart';
import 'package:shop/model/fill_in_order_model.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);
//购物车数据服务
class CartService {

  //添加商品至购物车
  Future addCart(Map<String, dynamic> parameters, OnSuccess onSuccess, {OnFail onFail, Options options}) async {
    try {
      var response;
      if (options == null) {
        response = await HttpUtil.instance.post(ServerUrl.CART_ADD, parameters: parameters);
      } else {
        response = await HttpUtil.instance.post(ServerUrl.CART_ADD, parameters: parameters, options: options);
      }
      if (response['errno'] == 0) {
        //添加成功返回成功消息
        onSuccess(KString.SUCCESS);
      } else {
        //添加失败返回失败消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //查询购物车列表数据,购物车页面使用此方法
  Future queryCart(OnSuccess onSuccess, {OnFail onFail, Options options}) async {
    try {
      var response;
      response = await HttpUtil.instance.get(ServerUrl.CART_LIST, options: options);
      if (response['errno'] == 0) {
        //将返回的Json数据转换成购物车列表数据
        CartListModel cartList = CartListModel.fromJson(response['data']);
        onSuccess(cartList);
      } else {
        //返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //删除购物车商品
  Future deleteCart(OnSuccess onSuccess, OnFail onFail, Map<String, dynamic> parameters) async {
    try {
      var response;
      response = await HttpUtil.instance.post(ServerUrl.CART_DELETE,  parameters: parameters);
      if (response['errno'] == 0) {
        //删除成功返回成功消息
        onSuccess(KString.SUCCESS);
      } else {
        //返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //更新购物车商品,可用于更新商品购买数量
  Future updateCart(OnSuccess onSuccess, OnFail onFail, Options options, Map<String, dynamic> parameters) async {
    try {
      var response;
      response = await HttpUtil.instance.post(ServerUrl.CART_UPDATE, options: options, parameters: parameters);
      if (response['errno'] == 0) {
        //返回更新成功消息
        onSuccess(KString.SUCCESS);
      } else {
        //返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //购物车商品勾选处理
  Future cartCheck(OnSuccess onSuccess, OnFail onFail, Map<String, dynamic> parameters) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.CART_CHECK,parameters: parameters);
      if (response['errno'] == 0) {
        //将返回的Json数据转换成购物车列表数据
        CartListModel cartList = CartListModel.fromJson(response['data']);
        onSuccess(cartList);
      } else {
        //返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //获取购物车数据,填写商品订页面单使用
  Future getCartDataForFillInOrder(OnSuccess onSuccess, OnFail onFail, Map<String, dynamic> parameters) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.CART_BUY, parameters: parameters);
      if (response['errno'] == 0) {
        //将返回的Json数据转换成填写订单数据模型
        FillInOrderModel fillInOrderModel = FillInOrderModel.fromJson(response['data']);
        onSuccess(fillInOrderModel);
      } else {
        //返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //立即购买
  Future fastBuy(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail,) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.FAST_BUY, parameters: parameters,);
      if (response['errno'] == 0) {
        //购买成功返回数据
        onSuccess(response["data"]);
      } else {
        //返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

}
