// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_in_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillInOrderModel _$FillInOrderModelFromJson(Map<String, dynamic> json) {
  return FillInOrderModel(
    (json['actualPrice'] as num)?.toDouble(),
    (json['orderTotalPrice'] as num)?.toDouble(),
    json['cartId'] as int,
    (json['goodsTotalPrice'] as num)?.toDouble(),
    json['addressId'] as int,
    json['checkedAddress'] == null
        ? null
        : CheckedAddressModel.fromJson(
            json['checkedAddress'] as Map<String, dynamic>),
    (json['freightPrice'] as num)?.toDouble(),
    (json['checkedGoodsList'] as List)
        ?.map((e) => e == null
            ? null
            : CheckedGoodsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FillInOrderModelToJson(FillInOrderModel instance) =>
    <String, dynamic>{
      'actualPrice': instance.actualPrice,
      'orderTotalPrice': instance.orderTotalPrice,
      'cartId': instance.cartId,
      'goodsTotalPrice': instance.goodsTotalPrice,
      'addressId': instance.addressId,
      'checkedAddress': instance.checkedAddress,
      'freightPrice': instance.freightPrice,
      'checkedGoodsList': instance.checkedGoodsList,
    };

CheckedAddressModel _$CheckedAddressModelFromJson(Map<String, dynamic> json) {
  return CheckedAddressModel(
    json['id'] as int,
    json['name'] as String,
    json['userId'] as int,
    json['province'] as String,
    json['city'] as String,
    json['county'] as String,
    json['addressDetail'] as String,
    json['areaCode'] as String,
    json['tel'] as String,
    json['isDefault'] as bool,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$CheckedAddressModelToJson(
        CheckedAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'province': instance.province,
      'city': instance.city,
      'county': instance.county,
      'addressDetail': instance.addressDetail,
      'areaCode': instance.areaCode,
      'tel': instance.tel,
      'isDefault': instance.isDefault,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };

CheckedGoodsModel _$CheckedGoodsModelFromJson(Map<String, dynamic> json) {
  return CheckedGoodsModel(
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

Map<String, dynamic> _$CheckedGoodsModelToJson(CheckedGoodsModel instance) =>
    <String, dynamic>{
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
