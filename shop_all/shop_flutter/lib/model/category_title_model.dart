//model/category_title_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'category_title_model.g.dart';
//分类标题数据模型
@JsonSerializable()
class CategoryTitleModel extends Object {
  //当前分类
  @JsonKey(name: 'currentCategory')
  CategoryModel currentCategory;
  //同级分类
  @JsonKey(name: 'brotherCategory')
  List<CategoryModel> brotherCategory;
  //上一级分类
  @JsonKey(name: 'parentCategory')
  CategoryModel parentCategory;

  CategoryTitleModel(this.currentCategory,this.brotherCategory,this.parentCategory,);

  factory CategoryTitleModel.fromJson(Map<String, dynamic> srcJson) => _$CategoryTitleModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryTitleModelToJson(this);

}

//当前分类
@JsonSerializable()
class CategoryModel extends Object {
  //分类id
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
  //父id
  @JsonKey(name: 'pid')
  int pid;
  //图标地址
  @JsonKey(name: 'iconUrl')
  String iconUrl;
  //图片地址
  @JsonKey(name: 'picUrl')
  String picUrl;
  //等级
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

  CategoryModel(this.id,this.name,this.keywords,this.desc,this.pid,this.iconUrl,this.picUrl,this.level,this.sortOrder,this.addTime,this.updateTime,this.deleted,);

  factory CategoryModel.fromJson(Map<String, dynamic> srcJson) => _$CategoryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}
