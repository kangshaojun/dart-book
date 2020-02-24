//service/goods_service.dart文件
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/server_url.dart';
import 'package:shop/model/goods_model.dart';
import 'package:shop/model/goods_detail_model.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/category_title_model.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);

//商品数据服务
class GoodsService {
  //获取商品分类数据,参数为分类id
  Future getGoodsCategory(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.GOODS_CATEGORY, parameters: parameters);
      if (response['errno'] == 0) {
        //返回Json数据并转换成CategoryTitleModel数据模型
        CategoryTitleModel categoryTitleModel = CategoryTitleModel.fromJson(response["data"]);
        //成功回调
        onSuccess(categoryTitleModel);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //获取商品列表数据,参数为分类id
  Future getGoodsList(Map<String, dynamic> parameters, OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      var response = await HttpUtil.instance.get(ServerUrl.GOODS_LIST, parameters: parameters);
      if (response['errno'] == 0) {
        //获取返回数据
        responseList = response['data']['list'];
        //根据返回Json数据转换成GoodsListModel数据模型
        GoodsListModel goodsListModels = GoodsListModel.fromJson(responseList);
        //成功回调
        onSuccessList(goodsListModels.goodsModels);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //获取商品详情数据,参数为商品id
  Future getGoodsDetailData(Map<String, dynamic> parameters, OnSuccess onSuccess, {OnFail onFail}) async {
    try {
      var response = await HttpUtil.instance.get(ServerUrl.GOODS_DETAILS_URL, parameters: parameters);
      if (response['errno'] == 0) {
        //根据返回Json数据转换成GoodsDetailModel数据模型
        GoodsDetailModel goodsDetailModel = GoodsDetailModel.fromJson(response['data']);
        //成功回调
        onSuccess(goodsDetailModel);
      } else {
        //失败返回错误消息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      onFail(KString.SERVER_EXCEPTION);
    }
  }
}
