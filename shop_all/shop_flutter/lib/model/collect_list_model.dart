//model/collect_list_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'collect_list_model.g.dart';
//收藏列表数据文件
@JsonSerializable()
class CollectListModel extends Object {
  //总数
  @JsonKey(name: 'total')
  int total;
  //总页数
  @JsonKey(name: 'pages')
  int pages;
  //每页条数
  @JsonKey(name: 'limit')
  int limit;
  //页码
  @JsonKey(name: 'page')
  int page;
  //收藏列表
  @JsonKey(name: 'list')
  List<CollectModel> list;
  //构造方法
  CollectListModel(this.total,this.pages,this.limit,this.page,this.list,);

  factory CollectListModel.fromJson(Map<String, dynamic> srcJson) => _$CollectListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectListModelToJson(this);

}
//收藏数据模型
@JsonSerializable()
class CollectModel extends Object {
  //描述
  @JsonKey(name: 'brief')
  String brief;
  //图片
  @JsonKey(name: 'picUrl')
  String picUrl;
  //商品Id
  @JsonKey(name: 'valueId')
  int valueId;
  //名称
  @JsonKey(name: 'name')
  String name;
  //id
  @JsonKey(name: 'id')
  int id;
  //类型
  @JsonKey(name: 'type')
  int type;
  //价格
  @JsonKey(name: 'retailPrice')
  double retailPrice;
  //构造方法
  CollectModel(this.brief,this.picUrl,this.valueId,this.name,this.id,this.type,this.retailPrice,);

  factory CollectModel.fromJson(Map<String, dynamic> srcJson) => _$CollectModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectModelToJson(this);

}


