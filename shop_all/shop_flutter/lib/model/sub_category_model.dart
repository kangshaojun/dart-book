//model/sub_category_model.dart文件
import 'package:json_annotation/json_annotation.dart';

//二级分类扩展文件
part 'sub_category_model.g.dart';

//二级分类列表模型
class SubCategoryListModel {
  //二级分类列表
  List<SubCategoryModel> subCategoryModels;
  //构造方法
  SubCategoryListModel(this.subCategoryModels);

  factory SubCategoryListModel.fromJson(List<dynamic> parseJson) {
    List<SubCategoryModel> productModels;
    productModels =
        parseJson.map((i) => SubCategoryModel.fromJson(i)).toList();
    return SubCategoryListModel(productModels);
  }
}

//二级分类数据模型
@JsonSerializable()
class SubCategoryModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //名称
  @JsonKey(name: 'name')
  String name;
  //关键字
  @JsonKey(name: 'keywords')
  String keywords;
  //描述
  @JsonKey(name: 'desc')
  String desc;
  //父类id
  @JsonKey(name: 'pid')
  int pid;
  //图标路径
  @JsonKey(name: 'iconUrl')
  String iconUrl;
  //二级分类图片
  @JsonKey(name: 'picUrl')
  String picUrl;
  //分类等级
  @JsonKey(name: 'level')
  String level;
  //排序规则
  @JsonKey(name: 'sortOrder')
  int sortOrder;
  //添加时间
  @JsonKey(name: 'addTime')
  String addTime;
  //更新时间
  @JsonKey(name: 'updateTime')
  String updateTime;
  //是否删除
  @JsonKey(name: 'deleted')
  bool deleted;
  //构造方法
  SubCategoryModel(
    this.id,
    this.name,
    this.keywords,
    this.desc,
    this.pid,
    this.iconUrl,
    this.picUrl,
    this.level,
    this.sortOrder,
    this.addTime,
    this.updateTime,
    this.deleted,
  );

  factory SubCategoryModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SubCategoryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
