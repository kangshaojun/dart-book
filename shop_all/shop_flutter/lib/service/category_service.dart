//service/category_service.dart文件
import 'package:shop/utils/http_util.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/first_category_model.dart';
import 'package:shop/model/sub_category_model.dart';
//定义成功返回列表数据
typedef OnSuccessList<T>(List<T> list);
//定义成功返回数据
typedef OnSuccess<T>(T t);
//定义返回失败消息
typedef OnFail(String message);

//分类数据服务
class CategoryService {

  //获取一级分类数据,传入回调方法,不需要传入参数
  Future getFirstCategoryData(OnSuccessList onSuccessList, {OnFail onFail}) async {
    try {
      var responseList = [];
      //请求一级分类数据
      var response = await HttpUtil.instance.get(ServerUrl.CATEGORY_FIRST);
      if (response['errno'] == 0) {
        responseList = response['data'];
        //将返回的Json数据转换为FirstLevelListCategory模型
        FirstListCategoryModel firstLevelListCategory = FirstListCategoryModel.fromJson(responseList);
        //调用成功回调方法,返回一级分类数据
        onSuccessList(firstLevelListCategory.firstLevelCategory);
      } else {
        //返回服务端错误信息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务端错误信息
      onFail(KString.SERVER_EXCEPTION);
    }
  }
  //获取二级分类数据,传入分类Id,查询此分类下的所有分类
  Future getSubCategoryData(
      //请求参数,参数为分类Id
      Map<String, dynamic> parameters,
      OnSuccessList onSuccessList,
      {OnFail onFail}) async {
    try {
      var responseList = [];
      //查询二级分类数据
      var response = await HttpUtil.instance.get(ServerUrl.CATEGORY_SECOND, parameters: parameters);
      if (response['errno'] == 0) {
        responseList = response['data'];
        //将返回的Json数据转换为SubCategoryListModel模型
        SubCategoryListModel subCategoryListModel = SubCategoryListModel.fromJson(responseList);
        //调用成功回调方法,返回二级分类数据
        onSuccessList(subCategoryListModel.subCategoryModels);
      } else {
        //返回服务端错误信息
        onFail(response['errmsg']);
      }
    } catch (e) {
      print(e);
      //返回服务端错误信息
      onFail(KString.SERVER_EXCEPTION);
    }
  }


}
