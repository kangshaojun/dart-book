//model/fill_in_order_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'fill_in_order_model.g.dart';
//填写订单数据模型
@JsonSerializable()
class FillInOrderModel extends Object {
  //实付价格
  @JsonKey(name: 'actualPrice')
  double actualPrice;
  //订单总价
  @JsonKey(name: 'orderTotalPrice')
  double orderTotalPrice;
  //购物车Id
  @JsonKey(name: 'cartId')
  int cartId;
  //商品总价
  @JsonKey(name: 'goodsTotalPrice')
  double goodsTotalPrice;
  //地址Id
  @JsonKey(name: 'addressId')
  int addressId;
  @JsonKey(name: 'checkedAddress')
  CheckedAddressModel checkedAddress;
  //运费
  @JsonKey(name: 'freightPrice')
  double freightPrice;
  //购物车选择的商品列表
  @JsonKey(name: 'checkedGoodsList')
  List<CheckedGoodsModel> checkedGoodsList;
  //构造方法
  FillInOrderModel(this.actualPrice,this.orderTotalPrice,this.cartId,this.goodsTotalPrice,this.addressId,this.checkedAddress,this.freightPrice,this.checkedGoodsList,);

  factory FillInOrderModel.fromJson(Map<String, dynamic> srcJson) => _$FillInOrderModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FillInOrderModelToJson(this);

}
//已选择地址数据模型
@JsonSerializable()
class CheckedAddressModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //用户名称
  @JsonKey(name: 'name')
  String name;
  //用户Id
  @JsonKey(name: 'userId')
  int userId;
  //省
  @JsonKey(name: 'province')
  String province;
  //市
  @JsonKey(name: 'city')
  String city;
  //国家
  @JsonKey(name: 'county')
  String county;
  //地址详情
  @JsonKey(name: 'addressDetail')
  String addressDetail;
  //地区编码
  @JsonKey(name: 'areaCode')
  String areaCode;
  //电话
  @JsonKey(name: 'tel')
  String tel;
  //是否为默认地址
  @JsonKey(name: 'isDefault')
  bool isDefault;
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
  CheckedAddressModel(this.id,this.name,this.userId,this.province,this.city,this.county,this.addressDetail,this.areaCode,this.tel,this.isDefault,this.addTime,this.updateTime,this.deleted,);

  factory CheckedAddressModel.fromJson(Map<String, dynamic> srcJson) => _$CheckedAddressModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CheckedAddressModelToJson(this);

}
//已选择商品数据模型
@JsonSerializable()
class CheckedGoodsModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //用户Id
  @JsonKey(name: 'userId')
  int userId;
  //商品Id
  @JsonKey(name: 'goodsId')
  int goodsId;
  //商品编号
  @JsonKey(name: 'goodsSn')
  String goodsSn;
  //商品名称
  @JsonKey(name: 'goodsName')
  String goodsName;
  //规格Id
  @JsonKey(name: 'productId')
  int productId;
  //价格
  @JsonKey(name: 'price')
  double price;
  //数量
  @JsonKey(name: 'number')
  int number;
  //规格值
  @JsonKey(name: 'specifications')
  List<String> specifications;
  //是否勾选
  @JsonKey(name: 'checked')
  bool checked;
  //图片地址
  @JsonKey(name: 'picUrl')
  String picUrl;
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
  CheckedGoodsModel(this.id,this.userId,this.goodsId,this.goodsSn,this.goodsName,this.productId,this.price,this.number,this.specifications,this.checked,this.picUrl,this.addTime,this.updateTime,this.deleted,);

  factory CheckedGoodsModel.fromJson(Map<String, dynamic> srcJson) => _$CheckedGoodsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CheckedGoodsModelToJson(this);

}


