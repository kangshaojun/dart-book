// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return OrderDetailModel(
    json['orderInfo'] == null
        ? null
        : OrderInfoModel.fromJson(json['orderInfo'] as Map<String, dynamic>),
    (json['orderGoods'] as List)
        ?.map((e) => e == null
            ? null
            : OrderDetailGoodsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'orderInfo': instance.orderInfo,
      'orderGoods': instance.orderGoods,
    };

OrderInfoModel _$OrderInfoModelFromJson(Map<String, dynamic> json) {
  return OrderInfoModel(
    json['consignee'] as String,
    json['address'] as String,
    json['addTime'] as String,
    json['orderSn'] as String,
    (json['actualPrice'] as num)?.toDouble(),
    json['mobile'] as String,
    json['orderStatusText'] as String,
    (json['goodsPrice'] as num)?.toDouble(),
    json['id'] as int,
    (json['freightPrice'] as num)?.toDouble(),
    json['handleOption'] == null
        ? null
        : HandleOption.fromJson(json['handleOption'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderInfoModelToJson(OrderInfoModel instance) =>
    <String, dynamic>{
      'consignee': instance.consignee,
      'address': instance.address,
      'addTime': instance.addTime,
      'orderSn': instance.orderSn,
      'actualPrice': instance.actualPrice,
      'mobile': instance.mobile,
      'orderStatusText': instance.orderStatusText,
      'goodsPrice': instance.goodsPrice,
      'id': instance.id,
      'freightPrice': instance.freightPrice,
      'handleOption': instance.handleOption,
    };

OrderDetailGoodsModel _$OrderDetailGoodsModelFromJson(
    Map<String, dynamic> json) {
  return OrderDetailGoodsModel(
    json['id'] as int,
    json['orderId'] as int,
    json['goodsId'] as int,
    json['goodsName'] as String,
    json['goodsSn'] as String,
    json['productId'] as int,
    json['number'] as int,
    (json['price'] as num)?.toDouble(),
    (json['specifications'] as List)?.map((e) => e as String)?.toList(),
    json['picUrl'] as String,
    json['comment'] as int,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$OrderDetailGoodsModelToJson(
        OrderDetailGoodsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'goodsSn': instance.goodsSn,
      'productId': instance.productId,
      'number': instance.number,
      'price': instance.price,
      'specifications': instance.specifications,
      'picUrl': instance.picUrl,
      'comment': instance.comment,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };

HandleOption _$HandleOptionFromJson(Map<String, dynamic> json) {
  return HandleOption(
    json['cancel'] as bool,
    json['delete'] as bool,
    json['pay'] as bool,
    json['comment'] as bool,
    json['confirm'] as bool,
    json['refund'] as bool,
    json['rebuy'] as bool,
  );
}

Map<String, dynamic> _$HandleOptionToJson(HandleOption instance) =>
    <String, dynamic>{
      'cancel': instance.cancel,
      'delete': instance.delete,
      'pay': instance.pay,
      'comment': instance.comment,
      'confirm': instance.confirm,
      'refund': instance.refund,
      'rebuy': instance.rebuy,
    };
