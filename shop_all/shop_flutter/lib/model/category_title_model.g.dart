// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_title_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryTitleModel _$CategoryTitleModelFromJson(Map<String, dynamic> json) {
  return CategoryTitleModel(
    json['currentCategory'] == null
        ? null
        : CategoryModel.fromJson(
            json['currentCategory'] as Map<String, dynamic>),
    (json['brotherCategory'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['parentCategory'] == null
        ? null
        : CategoryModel.fromJson(
            json['parentCategory'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryTitleModelToJson(CategoryTitleModel instance) =>
    <String, dynamic>{
      'currentCategory': instance.currentCategory,
      'brotherCategory': instance.brotherCategory,
      'parentCategory': instance.parentCategory,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    json['id'] as int,
    json['name'] as String,
    json['keywords'] as String,
    json['desc'] as String,
    json['pid'] as int,
    json['iconUrl'] as String,
    json['picUrl'] as String,
    json['level'] as String,
    json['sortOrder'] as int,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keywords': instance.keywords,
      'desc': instance.desc,
      'pid': instance.pid,
      'iconUrl': instance.iconUrl,
      'picUrl': instance.picUrl,
      'level': instance.level,
      'sortOrder': instance.sortOrder,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };
