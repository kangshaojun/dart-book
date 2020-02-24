//model/order_detail_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'order_detail_model.g.dart';
//订单详情数据模型
@JsonSerializable()
class OrderDetailModel extends Object {
  //订单信息
  @JsonKey(name: 'orderInfo')
  OrderInfoModel orderInfo;
  //订单商品
  @JsonKey(name: 'orderGoods')
  List<OrderDetailGoodsModel> orderGoods;
  //构造方法
  OrderDetailModel(this.orderInfo,this.orderGoods,);

  factory OrderDetailModel.fromJson(Map<String, dynamic> srcJson) => _$OrderDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);

}
//订单信息数据模型
@JsonSerializable()
class OrderInfoModel extends Object {
  //收货人
  @JsonKey(name: 'consignee')
  String consignee;
  //地址
  @JsonKey(name: 'address')
  String address;
  //添加时间
  @JsonKey(name: 'addTime')
  String addTime;
  //订单编号
  @JsonKey(name: 'orderSn')
  String orderSn;
  //实付价格
  @JsonKey(name: 'actualPrice')
  double actualPrice;
  //电话
  @JsonKey(name: 'mobile')
  String mobile;
  //订单状态
  @JsonKey(name: 'orderStatusText')
  String orderStatusText;
  //商品价格
  @JsonKey(name: 'goodsPrice')
  double goodsPrice;
  //订单Id
  @JsonKey(name: 'id')
  int id;
  //运费
  @JsonKey(name: 'freightPrice')
  double freightPrice;
  //操作选项
  @JsonKey(name: 'handleOption')
  HandleOption handleOption;
  //构造方法
  OrderInfoModel(this.consignee,this.address,this.addTime,this.orderSn,this.actualPrice,this.mobile,this.orderStatusText,this.goodsPrice,this.id,this.freightPrice,this.handleOption);

  factory OrderInfoModel.fromJson(Map<String, dynamic> srcJson) => _$OrderInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderInfoModelToJson(this);

}
//订单商品数据模型
@JsonSerializable()
class OrderDetailGoodsModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //订单Id
  @JsonKey(name: 'orderId')
  int orderId;
  //商品Id
  @JsonKey(name: 'goodsId')
  int goodsId;
  //商品名称
  @JsonKey(name: 'goodsName')
  String goodsName;
  //商品编号
  @JsonKey(name: 'goodsSn')
  String goodsSn;
  //产品规格Id
  @JsonKey(name: 'productId')
  int productId;
  //商品数量
  @JsonKey(name: 'number')
  int number;
  //商品价格
  @JsonKey(name: 'price')
  double price;
  //
  @JsonKey(name: 'specifications')
  List<String> specifications;
  //商品图片
  @JsonKey(name: 'picUrl')
  String picUrl;
  //评论
  @JsonKey(name: 'comment')
  int comment;
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
  OrderDetailGoodsModel(this.id,this.orderId,this.goodsId,this.goodsName,this.goodsSn,this.productId,this.number,this.price,this.specifications,this.picUrl,this.comment,this.addTime,this.updateTime,this.deleted,);

  factory OrderDetailGoodsModel.fromJson(Map<String, dynamic> srcJson) => _$OrderDetailGoodsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderDetailGoodsModelToJson(this);

}
//操作选项
@JsonSerializable()
class HandleOption extends Object {
  //取消
  @JsonKey(name: 'cancel')
  bool cancel;
  //删除
  @JsonKey(name: 'delete')
  bool delete;
  //购买
  @JsonKey(name: 'pay')
  bool pay;
  //评论
  @JsonKey(name: 'comment')
  bool comment;
  //确认
  @JsonKey(name: 'confirm')
  bool confirm;
  //退款
  @JsonKey(name: 'refund')
  bool refund;
  //重新购买
  @JsonKey(name: 'rebuy')
  bool rebuy;
  //构造方法
  HandleOption(this.cancel,this.delete,this.pay,this.comment,this.confirm,this.refund,this.rebuy,);

  factory HandleOption.fromJson(Map<String, dynamic> srcJson) => _$HandleOptionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HandleOptionToJson(this);

}


