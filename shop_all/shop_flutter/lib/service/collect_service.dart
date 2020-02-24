//service/collect_service.dart文件
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/server_url.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/collect_list_model.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);

//收藏数据服务
class CollectService {
  //添加或删除收藏
  Future addOrDeleteCollect(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(ServerUrl.COLLECT_ADD_DELETE, parameters: parameters,);
      if (response['errno'] == 0) {
        //成功返回
        onSuccess(response["errmsg"]);
      } else {
        //失败返回
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务端异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //查询我的收藏
  Future queryCollect(Map<String, dynamic> parameters, OnSuccessList onSuccessList, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.COLLECT_LIST, parameters: parameters, );
      if (response['errno'] == 0) {
        //将返回的Json数据转换成收藏列表数据模型
        CollectListModel collectModel = CollectListModel.fromJson(response["data"]);
        //成功返回列表数据
        onSuccessList(collectModel.list);
      } else {
        //失败返回
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务端异常消息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
}
