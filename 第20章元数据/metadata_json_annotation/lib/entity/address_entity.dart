//metadata_json_annotation_address_entity.dart文件
import 'package:json_annotation/json_annotation.dart';

part 'address_entity.g.dart';

//地址实体类
@JsonSerializable()
class AddressEntity extends Object {

  //id
  @JsonKey(name: 'id')
  int id;

  //用户名
  @JsonKey(name: 'name')
  String name;

  //用户id
  @JsonKey(name: 'userId')
  String userId;

  //省
  @JsonKey(name: 'province')
  String province;

  //城市
  @JsonKey(name: 'city')
  String city;

  //国家
  @JsonKey(name: 'county')
  String county;

  //详细地址
  @JsonKey(name: 'addressDetail')
  String addressDetail;

  //地区编码
  @JsonKey(name: 'areaCode')
  String areaCode;

  //电话号码
  @JsonKey(name: 'tel')
  String tel;

  //是否为默认地址
  @JsonKey(name: 'isDefault')
  bool isDefault;

  //添加地址时间
  @JsonKey(name: 'addTime')
  String addTime;

  //更新地址时间
  @JsonKey(name: 'updateTime')
  String updateTime;

  //是否删除
  @JsonKey(name: 'deleted')
  bool deleted;

  //构造方法,传入地址信息
  AddressEntity(this.id,this.name,this.userId,this.province,this.city,this.county,this.addressDetail,this.areaCode,this.tel,this.isDefault,this.addTime,this.updateTime,this.deleted,);

  //使用此方法将Json将换成实体对象
  factory AddressEntity.fromJson(Map<String, dynamic> srcJson) => _$AddressEntityFromJson(srcJson);

  //使用此方法将实例对象转换成Json
  Map<String, dynamic> toJson() => _$AddressEntityToJson(this);

}


