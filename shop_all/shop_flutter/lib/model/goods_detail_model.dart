//model/goods_detail_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'goods_detail_model.g.dart';
//商品详情数据模型
@JsonSerializable()
class GoodsDetailModel extends Object {
  //常见问题
  @JsonKey(name: 'issue')
  List<IssueModel> issue;
  //商品属性
  @JsonKey(name: 'attribute')
  List<AttributeModel> attribute;
  //商品规格
  @JsonKey(name: 'productList')
  List<ProductModel> productList;
  //商品信息
  @JsonKey(name: 'info')
  InfoModel info;
  //构造方法
  GoodsDetailModel(this.issue,this.attribute,this.productList,this.info,);

  factory GoodsDetailModel.fromJson(Map<String, dynamic> srcJson) => _$GoodsDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsDetailModelToJson(this);

}
//常见问题
@JsonSerializable()
class IssueModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //问
  @JsonKey(name: 'question')
  String question;
  //答
  @JsonKey(name: 'answer')
  String answer;
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
  IssueModel(this.id,this.question,this.answer,this.addTime,this.updateTime,this.deleted,);

  factory IssueModel.fromJson(Map<String, dynamic> srcJson) => _$IssueModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IssueModelToJson(this);

}
//商品属性
@JsonSerializable()
class AttributeModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //商品Id
  @JsonKey(name: 'goodsId')
  int goodsId;
  //属性
  @JsonKey(name: 'attribute')
  String attribute;
  //值
  @JsonKey(name: 'value')
  String value;
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
  AttributeModel(this.id,this.goodsId,this.attribute,this.value,this.addTime,this.updateTime,this.deleted,);

  factory AttributeModel.fromJson(Map<String, dynamic> srcJson) => _$AttributeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AttributeModelToJson(this);

}
//商品规格数据模型
@JsonSerializable()
class ProductModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //商品Id
  @JsonKey(name: 'goodsId')
  int goodsId;
  //规格值
  @JsonKey(name: 'specifications')
  List<String> specifications;
  //价格
  @JsonKey(name: 'price')
  double price;
  //数量
  @JsonKey(name: 'number')
  int number;
  //图片路径
  @JsonKey(name: 'url')
  String url;
  //添加时间
  @JsonKey(name: 'addTime')
  String addTime;
  //更新时间
  @JsonKey(name: 'updateTime')
  String updateTime;
  //是否删除
  @JsonKey(name: 'deleted')
  bool deleted;
  //
  ProductModel(this.id,this.goodsId,this.specifications,this.price,this.number,this.url,this.addTime,this.updateTime,this.deleted,);

  factory ProductModel.fromJson(Map<String, dynamic> srcJson) => _$ProductModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}
//商品信息
@JsonSerializable()
class InfoModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //商品编号
  @JsonKey(name: 'goodsSn')
  String goodsSn;
  //名称
  @JsonKey(name: 'name')
  String name;
  //分类Id
  @JsonKey(name: 'categoryId')
  int categoryId;
  //图片
  @JsonKey(name: 'gallery')
  List<String> gallery;
  //关键字
  @JsonKey(name: 'keywords')
  String keywords;
  //简介
  @JsonKey(name: 'brief')
  String brief;
  //是否在售
  @JsonKey(name: 'isOnSale')
  bool isOnSale;
  //排序规则
  @JsonKey(name: 'sortOrder')
  int sortOrder;
  //图片地址
  @JsonKey(name: 'picUrl')
  String picUrl;
  //分享地址
  @JsonKey(name: 'shareUrl')
  String shareUrl;
  //是否为新品
  @JsonKey(name: 'isNew')
  bool isNew;
  //是否为热卖商品
  @JsonKey(name: 'isHot')
  bool isHot;
  //单位
  @JsonKey(name: 'unit')
  String unit;
  //专柜价格
  @JsonKey(name: 'counterPrice')
  double counterPrice;
  //零售价格
  @JsonKey(name: 'retailPrice')
  double retailPrice;
  //添加时间
  @JsonKey(name: 'addTime')
  String addTime;
  //更新时间
  @JsonKey(name: 'updateTime')
  String updateTime;
  //是否删除
  @JsonKey(name: 'deleted')
  bool deleted;
  //详情
  @JsonKey(name: 'detail')
  String detail;
  //构造方法
  InfoModel(this.id,this.goodsSn,this.name,this.categoryId,this.gallery,this.keywords,this.brief,this.isOnSale,this.sortOrder,this.picUrl,this.shareUrl,this.isNew,this.isHot,this.unit,this.counterPrice,this.retailPrice,this.addTime,this.updateTime,this.deleted,this.detail,);

  factory InfoModel.fromJson(Map<String, dynamic> srcJson) => _$InfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);

}


