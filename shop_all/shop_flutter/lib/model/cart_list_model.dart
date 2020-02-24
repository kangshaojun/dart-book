//model/cart_list_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'cart_list_model.g.dart';

//购物车列表数据模型
@JsonSerializable()
class CartListModel extends Object {
  //统计数据
  @JsonKey(name: 'cartTotal')
  CartTotalModel cartTotal;
  //商品数据列表
  @JsonKey(name: 'cartList')
  List<CartModel> cartList;
  //构造方法
  CartListModel(this.cartTotal, this.cartList,);

  factory CartListModel.fromJson(Map<String, dynamic> srcJson) => _$CartListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartListModelToJson(this);
}

//购物车统计数据模型
@JsonSerializable()
class CartTotalModel extends Object {

  //商品总数
  @JsonKey(name: 'goodsAmount')
  double goodsAmount;

  //选择的商品总数
  @JsonKey(name: 'checkedGoodsAmount')
  double checkedGoodsAmount;
  //构造方法
  CartTotalModel(this.goodsAmount, this.checkedGoodsAmount,);

  factory CartTotalModel.fromJson(Map<String, dynamic> srcJson) => _$CartTotalModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartTotalModelToJson(this);
}

//购物车商品数据模型
@JsonSerializable()
class CartModel extends Object {
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
  //产品规格Id
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
  //是否选择
  @JsonKey(name: 'checked')
  bool checked;
  //图片
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
  CartModel(
    this.id,
    this.userId,
    this.goodsId,
    this.goodsSn,
    this.goodsName,
    this.productId,
    this.price,
    this.number,
    this.specifications,
    this.checked,
    this.picUrl,
    this.addTime,
    this.updateTime,
    this.deleted,
  );

  factory CartModel.fromJson(Map<String, dynamic> srcJson) => _$CartModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
