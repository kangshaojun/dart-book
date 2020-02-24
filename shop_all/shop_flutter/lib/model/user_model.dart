//model/user_model.dart文件
import 'package:json_annotation/json_annotation.dart';

//数据模型扩展文件
part 'user_model.g.dart';

//用户数据模型
@JsonSerializable()
class UserModel extends Object {

  //用户基本信息
  @JsonKey(name: 'userInfo')
  UserInfo userInfo;

  //服务端返回的token值
  @JsonKey(name: 'token')
  String token;

  //构造方法
  UserModel(this.userInfo,this.token,);

  factory UserModel.fromJson(Map<String, dynamic> srcJson) => _$UserModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}

//用户信息数据模型
@JsonSerializable()
class UserInfo extends Object {

  //昵称
  @JsonKey(name: 'nickName')
  String nickName;

  //头像地址
  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  //构造方法
  UserInfo(this.nickName,this.avatarUrl,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}


