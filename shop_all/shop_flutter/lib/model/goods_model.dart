//model/goods_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//商品数据模型扩展
part 'goods_model.g.dart';

//商品列表数据模型
class GoodsListModel {
  //商品列表
  List<GoodsModel> goodsModels;
  //构造方法
  GoodsListModel(this.goodsModels);

  factory GoodsListModel.fromJson(List<dynamic> parseJson) {
    List<GoodsModel> goodsModels;
    goodsModels = parseJson.map((i) => GoodsModel.fromJson(i)).toList();
    return GoodsListModel(goodsModels);
  }
}

//商品数据模型
@JsonSerializable()
class GoodsModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //名称
  @JsonKey(name: 'name')
  String name;
  //简介
  @JsonKey(name: 'brief')
  String brief;
  //图片地址
  @JsonKey(name: 'picUrl')
  String picUrl;
  //是否为新品
  @JsonKey(name: 'isNew')
  bool isNew;
  //是否热卖
  @JsonKey(name: 'isHot')
  bool isHot;
  //专柜价格
  @JsonKey(name: 'counterPrice')
  double counterPrice;
  //零售价格
  @JsonKey(name: 'retailPrice')
  double retailPrice;
  //构造方法
  GoodsModel(
    this.id,
    this.name,
    this.brief,
    this.picUrl,
    this.isNew,
    this.isHot,
    this.counterPrice,
    this.retailPrice,
  );

  factory GoodsModel.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsModelToJson(this);
}
