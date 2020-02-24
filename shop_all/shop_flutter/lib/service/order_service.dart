//service/order_service.dart文件
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/server_url.dart';
import 'package:shop/model/order_detail_model.dart';
import 'package:shop/model/order_model.dart';
import 'package:shop/config/index.dart';
import 'package:dio/dio.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);
//订单数据服务
class OrderService {
  //提交订单,传入购物车Id,地址Id以及备注等参数
  Future submitOrder(Options options, Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail,) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.ORDER_SUBMIT, parameters: parameters, options: options);
      if (response['errno'] == 0) {
        //提交成功提示
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
  //查询我的订单数据,传入分页相关参数
  Future queryOrder(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.ORDER_LIST, parameters: parameters, );
      if (response['errno'] == 0) {
        //将Json数据转换成订单列表数据模型
        OrderListModel orderModel = OrderListModel.fromJson(response["data"]);
        onSuccess(orderModel.list);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //删除订单,传入订单Id参数
  Future deleteOrder(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.ORDER_DELETE, parameters: parameters, );
      if (response["errno"] == 0) {
        onSuccess(KString.SUCCESS);
      } else {
        onFail(response["errmsg"]);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //取消订单,传入订单Id参数
  Future cancelOrder(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.ORDER_CANCEL, parameters: parameters, );
      if (response["errno"] == 0) {
        onSuccess(KString.SUCCESS);
      } else {
        onFail(response["errmsg"]);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //查询订单详情,传入订单Id参数
  Future queryOrderDetail(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.ORDER_DETAIL, parameters: parameters,);
      if (response['errno'] == 0) {
        //将Json数据转换成订单详情数据模型
        OrderDetailModel orderDetailModel = OrderDetailModel.fromJson(response["data"]);
        onSuccess(orderDetailModel);
      } else {
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

}
