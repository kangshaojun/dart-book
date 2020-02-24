//service/user_service.dart文件
import 'package:shop/config/index.dart';
import 'package:shop/utils/http_util.dart';
import 'package:shop/model/user_model.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);

//用户数据服务
class UserService {

  //注册请求方法,需要传递账号,密码等参数
  Future register(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      //post请求注册地址
      var response = await HttpUtil.instance.post(ServerUrl.REGISTER, parameters: parameters);
      if (response['errno'] == 0) {
        //成功返回
        onSuccess("");
      } else {
        //注册失败
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //服务器接口异常
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //登录请求方法,需要传递传递账号,密码等参数
  Future login(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.LOGIN, parameters: parameters);
      if (response['errno'] == 0) {
        //返回token及用户基本信息
        UserModel userModel = UserModel.fromJson(response['data']);
        //登录成功
        onSuccess(userModel);
      } else {
        //登录失败,返回失败信息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(KString.SERVER_EXCEPTION);
    }
  }

  //登出请求方法
  Future loginOut(OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.LOGIN_OUT);
      if (response['errno'] == 0) {
        //登出成功
        onSuccess(KString.SUCCESS);
      } else {
        //登出失败
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(KString.SERVER_EXCEPTION);
    }
  }
}
