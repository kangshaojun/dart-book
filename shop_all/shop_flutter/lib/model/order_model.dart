//model/order_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'order_model.g.dart';
//订单列表数据模型
@JsonSerializable()
class OrderListModel extends Object {
  //订单总数
  @JsonKey(name: 'total')
  int total;
  //页数
  @JsonKey(name: 'pages')
  int pages;
  //每页显示的数量
  @JsonKey(name: 'limit')
  int limit;
  //当前页
  @JsonKey(name: 'page')
  int page;
  //订单列表
  @JsonKey(name: 'list')
  List<OrderModel> list;
  //构造方法
  OrderListModel(this.total,this.pages,this.limit,this.page,this.list,);

  factory OrderListModel.fromJson(Map<String, dynamic> srcJson) => _$OrderListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderListModelToJson(this);

}
//订单数据模型
@JsonSerializable()
class OrderModel extends Object {
  //订单状态
  @JsonKey(name: 'orderStatusText')
  String orderStatusText;
  //订单编号
  @JsonKey(name: 'orderSn')
  String orderSn;
  //价格
  @JsonKey(name: 'actualPrice')
  double actualPrice;
  //商品列表
  @JsonKey(name: 'goodsList')
  List<OrderGoodsModel> goodsList;
  //订单Id
  @JsonKey(name: 'id')
  int id;
  //构造方法
  OrderModel(this.orderStatusText,this.orderSn,this.actualPrice,this.goodsList,this.id);

  factory OrderModel.fromJson(Map<String, dynamic> srcJson) => _$OrderModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}
//订单商品数据模型
@JsonSerializable()
class OrderGoodsModel extends Object {
  //商品数量
  @JsonKey(name: 'number')
  int number;
  //图片
  @JsonKey(name: 'picUrl')
  String picUrl;
  //价格
  @JsonKey(name: 'price')
  double price;
  //id
  @JsonKey(name: 'id')
  int id;
  //名称
  @JsonKey(name: 'goodsName')
  String goodsName;
  //规格
  @JsonKey(name: 'specifications')
  List<String> specifications;
  //构造方法
  OrderGoodsModel(this.number,this.picUrl,this.price,this.id,this.goodsName,this.specifications,);

  factory OrderGoodsModel.fromJson(Map<String, dynamic> srcJson) => _$OrderGoodsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderGoodsModelToJson(this);

}



