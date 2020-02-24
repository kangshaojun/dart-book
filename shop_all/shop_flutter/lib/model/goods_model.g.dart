// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsModel _$GoodsModelFromJson(Map<String, dynamic> json) {
  return GoodsModel(
    json['id'] as int,
    json['name'] as String,
    json['brief'] as String,
    json['picUrl'] as String,
    json['isNew'] as bool,
    json['isHot'] as bool,
    (json['counterPrice'] as num)?.toDouble(),
    (json['retailPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GoodsModelToJson(GoodsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
    };
