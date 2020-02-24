// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetailModel _$GoodsDetailModelFromJson(Map<String, dynamic> json) {
  return GoodsDetailModel(
    (json['issue'] as List)
        ?.map((e) =>
            e == null ? null : IssueModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['attribute'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['productList'] as List)
        ?.map((e) =>
            e == null ? null : ProductModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['info'] == null
        ? null
        : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GoodsDetailModelToJson(GoodsDetailModel instance) =>
    <String, dynamic>{
      'issue': instance.issue,
      'attribute': instance.attribute,
      'productList': instance.productList,
      'info': instance.info,
    };

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) {
  return IssueModel(
    json['id'] as int,
    json['question'] as String,
    json['answer'] as String,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };

AttributeModel _$AttributeModelFromJson(Map<String, dynamic> json) {
  return AttributeModel(
    json['id'] as int,
    json['goodsId'] as int,
    json['attribute'] as String,
    json['value'] as String,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$AttributeModelToJson(AttributeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goodsId': instance.goodsId,
      'attribute': instance.attribute,
      'value': instance.value,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    json['id'] as int,
    json['goodsId'] as int,
    (json['specifications'] as List)?.map((e) => e as String)?.toList(),
    (json['price'] as num)?.toDouble(),
    json['number'] as int,
    json['url'] as String,
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goodsId': instance.goodsId,
      'specifications': instance.specifications,
      'price': instance.price,
      'number': instance.number,
      'url': instance.url,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) {
  return InfoModel(
    json['id'] as int,
    json['goodsSn'] as String,
    json['name'] as String,
    json['categoryId'] as int,
    (json['gallery'] as List)?.map((e) => e as String)?.toList(),
    json['keywords'] as String,
    json['brief'] as String,
    json['isOnSale'] as bool,
    json['sortOrder'] as int,
    json['picUrl'] as String,
    json['shareUrl'] as String,
    json['isNew'] as bool,
    json['isHot'] as bool,
    json['unit'] as String,
    (json['counterPrice'] as num)?.toDouble(),
    (json['retailPrice'] as num)?.toDouble(),
    json['addTime'] as String,
    json['updateTime'] as String,
    json['deleted'] as bool,
    json['detail'] as String,
  );
}

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'id': instance.id,
      'goodsSn': instance.goodsSn,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'gallery': instance.gallery,
      'keywords': instance.keywords,
      'brief': instance.brief,
      'isOnSale': instance.isOnSale,
      'sortOrder': instance.sortOrder,
      'picUrl': instance.picUrl,
      'shareUrl': instance.shareUrl,
      'isNew': instance.isNew,
      'isHot': instance.isHot,
      'unit': instance.unit,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted,
      'detail': instance.detail,
    };
