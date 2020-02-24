// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListModel _$CartListModelFromJson(Map<String, dynamic> json) {
  return CartListModel(
    json['cartTotal'] == null
        ? null
        : CartTotalModel.fromJson(json['cartTotal'] as Map<String, dynamic>),
    (json['cartList'] as List)
        ?.map((e) =>
            e == null ? null : CartModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CartListModelToJson(CartListModel instance) =>
    <String, dynamic>{
      'cartTotal': instance.cartTotal,
      'cartList': instance.cartList,
    };

CartTotalModel _$CartTotalModelFromJson(Map<String, dynamic> json) {
  return CartTotalModel(
    (json['goodsAmount'] as num)?.toDouble(),
    (json['checkedGoodsAmount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CartTotalModelToJson(CartTotalModel instance) =>
    <String, dynamic>{
      'goodsAmount': instance.goodsAmount,
      'checkedGoodsAmount': instance.checkedGoodsAmount,
    };

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
    json['id'] as int,
    json['userId'] as int,
    json['goodsId'] as int,
    json['goodsSn'] as String,
    json['goodsName'] as String,
    json['productId'] as int,
    (json['price'] as num)?.toDouble(),
    json['number'] as int,
    (json['specifications'] as List)?.map((e) => e as String)?.toList(),
    json['checked'] as bool,
    json['picUrl'] as String,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'goodsId': instance.goodsId,
      'goodsSn': instance.goodsSn,
      'goodsName': instance.goodsName,
      'productId': instance.productId,
      'price': instance.price,
      'number': instance.number,
      'specifications': instance.specifications,
      'checked': instance.checked,
      'picUrl': instance.picUrl,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };
