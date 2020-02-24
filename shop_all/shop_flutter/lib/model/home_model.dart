//model/home_model.dart文件
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

//首页数据模型
@JsonSerializable()
class HomeModel extends Object {

  //新品列表
  @JsonKey(name: 'newGoodsList')
  List<Goods> newGoodsList;

  //分类列表
  @JsonKey(name: 'channel')
  List<Channel> channel;

  //轮播图列表
  @JsonKey(name: 'banner')
  List<BannerModel> banner;

  //热卖商品列表
  @JsonKey(name: 'hotGoodsList')
  List<Goods> hotGoodsList;

  //构造方法
  HomeModel(this.newGoodsList,this.channel,this.banner,this.hotGoodsList,);

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) => _$HomeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

}

//商品数据模型
@JsonSerializable()
class Goods extends Object {

  //商品id
  @JsonKey(name: 'id')
  int id;

  //商品名称
  @JsonKey(name: 'name')
  String name;

  //商品简介
  @JsonKey(name: 'brief')
  String brief;

  //商品图片
  @JsonKey(name: 'picUrl')
  String picUrl;

  //是否为新品
  @JsonKey(name: 'isNew')
  bool isNew;

  //是否为热卖商品
  @JsonKey(name: 'isHot')
  bool isHot;

  //专柜价格
  @JsonKey(name: 'counterPrice')
  double counterPrice;

  //零售价格
  @JsonKey(name: 'retailPrice')
  double retailPrice;

  Goods(this.id,this.name,this.brief,this.picUrl,this.isNew,this.isHot,this.counterPrice,this.retailPrice,);

  factory Goods.fromJson(Map<String, dynamic> srcJson) => _$GoodsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsToJson(this);

}

//分类数据
@JsonSerializable()
class Channel extends Object {
  //分类id
  @JsonKey(name: 'id')
  int id;
  //分类名称
  @JsonKey(name: 'name')
  String name;
  //分类图标地址
  @JsonKey(name: 'iconUrl')
  String iconUrl;

  Channel(this.id,this.name,this.iconUrl,);

  factory Channel.fromJson(Map<String, dynamic> srcJson) => _$ChannelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);

}


//轮播图数据模型
@JsonSerializable()
class BannerModel extends Object {

  //轮播图id
  @JsonKey(name: 'id')
  int id;

  //名称
  @JsonKey(name: 'name')
  String name;

  //轮播图链接
  @JsonKey(name: 'link')
  String link;

  //轮播图地址
  @JsonKey(name: 'url')
  String url;

  //位置
  @JsonKey(name: 'position')
  int position;

  //内容
  @JsonKey(name: 'content')
  String content;

  //是否启用
  @JsonKey(name: 'enabled')
  bool enabled;

  //添加时间
  @JsonKey(name: 'addTime')
  String addTime;

  //更新时间
  @JsonKey(name: 'updateTime')
  String updateTime;

  //是否删除
  @JsonKey(name: 'deleted')
  bool deleted;

  BannerModel(this.id,this.name,this.link,this.url,this.position,this.content,this.enabled,this.addTime,this.updateTime,this.deleted,);

  factory BannerModel.fromJson(Map<String, dynamic> srcJson) => _$BannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

}





