// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    (json['newGoodsList'] as List)
        ?.map(
            (e) => e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['channel'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['banner'] as List)
        ?.map((e) =>
            e == null ? null : BannerModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['hotGoodsList'] as List)
        ?.map(
            (e) => e == null ? null : Goods.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'newGoodsList': instance.newGoodsList,
      'channel': instance.channel,
      'banner': instance.banner,
      'hotGoodsList': instance.hotGoodsList,
    };

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
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

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    json['id'] as int,
    json['name'] as String,
    json['iconUrl'] as String,
  );
}

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    json['id'] as int,
    json['name'] as String,
    json['link'] as String,
    json['url'] as String,
    json['position'] as int,
    json['content'] as String,
    json['enabled'] as bool,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'url': instance.url,
      'position': instance.position,
      'content': instance.content,
      'enabled': instance.enabled,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };
