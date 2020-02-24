//metadata_json_annotation_address_main.dart文件
import 'dart:convert';
import 'package:helloworld/entity/address_entity.dart';

void main(){
  //收货地址模拟数据
  var data = ''' {
    "id": 1,
    "name": "张三",
    "userId": "000001",
    "province": "湖北",
    "city": "武汉",
    "county": "中国",
    "addressDetail": "某某街道",
    "areaCode": "111111",
    "tel": "88888888888",
    "isDefault": true,
    "addTime": "2019-09-25 18:32:49",
    "updateTime": "2019-09-25 18:32:49", 
    "deleted": false
  }''' ;
  //实例化AddressEntity对象
  //使用json.decode解码,
  //使用AddressEntity.fromJson方法将其转换成实例对象
  AddressEntity addressEntity = AddressEntity.fromJson(json.decode(data));
  //调用实体对象的toJson方法输出内容
  print(addressEntity.toJson().toString());
}