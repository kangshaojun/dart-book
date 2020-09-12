//model/user_model.dart文件
//用户数据模型
class UserModel{
  //Id
  int id;
  //Token值
  String token;
  //用户名
  String username;
  //手机号
  String mobile;
  //用户头像
  String head_image;
  //用户地址
  String address;

  //构造函数
  UserModel({this.id,this.token,this.username});

  //取Json数据
  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    token = json['token'];
    username = json['username'];
    mobile = json['mobile'];
    head_image = json['head_image'];
    address = json['address'];
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['head_image'] = this.head_image;
    return data;
  }

}




