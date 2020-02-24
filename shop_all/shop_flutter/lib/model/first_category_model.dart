//model/first_category_model.dart文件
import 'package:json_annotation/json_annotation.dart';

//扩展文件
part 'first_category_model.g.dart';

//一级分类数据列表模型
class FirstListCategoryModel {
  //一级分类数据列表
  List<FirstCategoryModel> firstLevelCategory;
  //构造方法
  FirstListCategoryModel(this.firstLevelCategory);

  factory FirstListCategoryModel.fromJson(List<dynamic> parseJson) {
    List<FirstCategoryModel> firstLevelCategorys;
    firstLevelCategorys =
        parseJson.map((i) => FirstCategoryModel.fromJson(i)).toList();
    return FirstListCategoryModel(firstLevelCategorys);
  }
}

//一级分类数据模型
@JsonSerializable()
class FirstCategoryModel extends Object {
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
  //父分类id
  @JsonKey(name: 'pid')
  int pid;
  //分类图标
  @JsonKey(name: 'iconUrl')
  String iconUrl;
  //分类图片
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
  FirstCategoryModel(
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

  factory FirstCategoryModel.fromJson(Map<String, dynamic> srcJson) =>
      _$FirstCategoryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FirstCategoryModelToJson(this);
}
