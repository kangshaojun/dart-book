// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectListModel _$CollectListModelFromJson(Map<String, dynamic> json) {
  return CollectListModel(
    json['total'] as int,
    json['pages'] as int,
    json['limit'] as int,
    json['page'] as int,
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : CollectModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CollectListModelToJson(CollectListModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'list': instance.list,
    };

CollectModel _$CollectModelFromJson(Map<String, dynamic> json) {
  return CollectModel(
    json['brief'] as String,
    json['picUrl'] as String,
    json['valueId'] as int,
    json['name'] as String,
    json['id'] as int,
    json['type'] as int,
    (json['retailPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CollectModelToJson(CollectModel instance) =>
    <String, dynamic>{
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'valueId': instance.valueId,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'retailPrice': instance.retailPrice,
    };
