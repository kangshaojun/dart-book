// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressListModel _$AddressListModelFromJson(Map<String, dynamic> json) {
  return AddressListModel(
    json['total'] as int,
    json['pages'] as int,
    json['limit'] as int,
    json['page'] as int,
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : AddressModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AddressListModelToJson(AddressListModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'limit': instance.limit,
      'page': instance.page,
      'list': instance.list,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
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

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
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
