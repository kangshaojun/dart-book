//service/address_service.dart文件
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/server_url.dart';
import 'package:shop/model/address_model.dart';
import 'package:shop/config/index.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);
//地址数据服务
class AddressService {
  //获取地址列表
  Future getAddressList( OnSuccess onSuccessList, {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.ADDRESS_LIST,);
      if (response['errno'] == 0) {
        //将返回的Json转换成地址列表数据模型
        AddressListModel addressModel = AddressListModel.fromJson(response['data']);
        print(response['data']);
        //成功返回列表数据
        onSuccessList(addressModel.list);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器错误消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //新增地址
  Future addAddress( Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.ADDRESS_SAVE,  parameters: parameters);
      if (response['errno'] == 0) {
        //返回添加成功消息
        onSuccess(KString.SUCCESS);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器错误消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //删除地址
  Future deleteAddress(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.ADDRESS_DELETE,parameters: parameters);
      if (response['errno'] == 0) {
        //返回删除成功消息
        onSuccess(KString.SUCCESS);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器错误消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //地址详细信息
  Future addressDetail(
     Map<String, dynamic> parameters, OnSuccess onSuccess, {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.ADDRESS_DETAIL,  parameters: parameters);
      if (response['errno'] == 0) {
        //将返回的Json数据转换成地址详情
        AddressModel addressDetail = AddressModel.fromJson(response["data"]);
        //返回数据
        onSuccess(addressDetail);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务器错误消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
}
