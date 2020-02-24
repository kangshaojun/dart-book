//model/address_model.dart文件
import 'package:json_annotation/json_annotation.dart';
//扩展文件
part 'address_model.g.dart';
//地址列表数据模型
@JsonSerializable()
class AddressListModel extends Object {
  //地址总数
  @JsonKey(name: 'total')
  int total;
  //总页数
  @JsonKey(name: 'pages')
  int pages;
  //分页数量
  @JsonKey(name: 'limit')
  int limit;
  //当前页
  @JsonKey(name: 'page')
  int page;
  //地址列表
  @JsonKey(name: 'list')
  List<AddressModel> list;
  //构造方法
  AddressListModel(this.total,this.pages,this.limit,this.page,this.list,);

  factory AddressListModel.fromJson(Map<String, dynamic> srcJson) => _$AddressListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressListModelToJson(this);

}
//地址数据模型
@JsonSerializable()
class AddressModel extends Object {
  //id
  @JsonKey(name: 'id')
  int id;
  //用户名
  @JsonKey(name: 'name')
  String name;
  //用户Id
  @JsonKey(name: 'userId')
  int userId;
  //省
  @JsonKey(name: 'province')
  String province;
  //市
  @JsonKey(name: 'city')
  String city;
  //国家
  @JsonKey(name: 'county')
  String county;
  //详情地址
  @JsonKey(name: 'addressDetail')
  String addressDetail;
  //地区编码
  @JsonKey(name: 'areaCode')
  String areaCode;
  //电话
  @JsonKey(name: 'tel')
  String tel;
  //是否为默认地址
  @JsonKey(name: 'isDefault')
  bool isDefault;
  //添加时间
  @JsonKey(name: 'addTime')
  String addTime;
  //更新时间
  @JsonKey(name: 'updateTime')
  String updateTime;
  //是否删除
  @JsonKey(name: 'deleted')
  bool deleted;
  //构造方法
  AddressModel(this.id,this.name,this.userId,this.province,this.city,this.county,this.addressDetail,this.areaCode,this.tel,this.isDefault,this.addTime,this.updateTime,this.deleted,);

  factory AddressModel.fromJson(Map<String, dynamic> srcJson) => _$AddressModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

}
