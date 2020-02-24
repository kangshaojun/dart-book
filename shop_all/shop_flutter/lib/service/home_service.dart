//service/home_service.dart文件
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/index.dart';
import 'package:shop/config/string.dart';
import 'package:shop/model/home_model.dart';

//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);

//首页数据服务
class HomeService {

  //查询首页数据,异步处理
  Future queryHomeData(OnSuccess onSuccess, OnFail onFail) async {
    try {
      //首页数据接口调用
      var response = await HttpUtil.instance.get(ServerUrl.HOME_URL);
      if (response['errno'] == 0) {
        //Json数据转换成HomeModel
        HomeModel homeModel = HomeModel.fromJson(response['data']);
        //调用成功回调方法返回数据
        onSuccess(homeModel);
      } else {
        //调用失败回调方法返回错误信息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //调用失败回调方法返回服务器异常信息
      onFail(KString.SERVER_EXCEPTION);
    }
  }

}