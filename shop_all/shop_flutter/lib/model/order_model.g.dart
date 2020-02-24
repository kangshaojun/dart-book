// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModel _$OrderListModelFromJson(Map<String, dynamic> json) {
  return OrderListModel(
    json['total'] as int,
    json['pages'] as int,
    json['limit'] as int,
    json['page'] as int,
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : OrderModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderListModelToJson(OrderListModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'list': instance.list,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    json['orderStatusText'] as String,
    json['orderSn'] as String,
    (json['actualPrice'] as num)?.toDouble(),
    (json['goodsList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderGoodsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['id'] as int,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderStatusText': instance.orderStatusText,
      'orderSn': instance.orderSn,
      'actualPrice': instance.actualPrice,
      'goodsList': instance.goodsList,
      'id': instance.id,
    };

OrderGoodsModel _$OrderGoodsModelFromJson(Map<String, dynamic> json) {
  return OrderGoodsModel(
    json['number'] as int,
    json['picUrl'] as String,
    (json['price'] as num)?.toDouble(),
    json['id'] as int,
    json['goodsName'] as String,
    (json['specifications'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OrderGoodsModelToJson(OrderGoodsModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'picUrl': instance.picUrl,
      'price': instance.price,
      'id': instance.id,
      'goodsName': instance.goodsName,
      'specifications': instance.specifications,
    };
