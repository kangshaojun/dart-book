//model/order_model.dart文件
//订单列表数据模型
class OrderListModel{

  //订单列表
  List<OrderModel> list;

  //构造函数
  OrderListModel({this.list});

  //取Json数据
  OrderListModel.fromJson(Map<String,dynamic> json){
    if(json['list'] != null){
      list = List<OrderModel>();
      json['list'].forEach((v){
        list.add(OrderModel.fromJson(v));
      });
    }
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();

    if(this.list != null){
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

//订单数据模型
class OrderModel{
  //Id
  int id;
  //用户Id
  int user_id;
  //付款金额
  int pay;
  //状态
  int status;
  //运费
  int express;
  //用户名
  String username;
  //商品
  String goods;
  //地址
  String address;
  //电话
  String mobile;

  //构造函数
  OrderModel({this.id,this.user_id,this.pay,this.status,this.express,this.username,this.goods,this.address,this.mobile});

  //取Json数据
  OrderModel.fromJson(Map<String,dynamic> jsonData){
    id = jsonData['id'];
    user_id = jsonData['user_id'];
    pay = jsonData['pay'];
    status = jsonData['status'];
    express = jsonData['express'];
    username = jsonData['username'];
    goods = jsonData['goods'];
    address = jsonData['address'];
    mobile = jsonData['mobile'];
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['pay'] = this.pay;
    data['status'] = this.status;
    data['express'] = this.express;
    data['username'] = this.username;
    data['goods'] = this.goods;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    return data;
  }

}

//订单商品数据模型
class OrderGoodModel{
  //Id
  int id;
  //用户Id
  int user_id;
  //商品Id
  int good_id;
  //商品数量
  int good_count;
  //商品名称
  String good_name;
  //商品价格
  int good_price;
  //商品图片
  String good_image;
  //是否选中
  int is_checked;

  //构造函数
  OrderGoodModel({this.id,this.user_id,this.good_id,this.good_count,this.good_name,this.good_price,this.good_image,this.is_checked});

  //取Json数据
  OrderGoodModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    user_id = json['user_id'];
    good_id = json['good_id'];
    good_count = json['good_count'];
    good_name = json['good_name'];
    good_price = json['good_price'];
    good_image = json['good_image'];
    is_checked = json['is_checked'];

  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['good_id'] = this.good_id;
    data['good_count'] = this.good_count;
    data['good_name'] = this.good_name;
    data['good_price'] = this.good_price;
    data['good_image'] = this.good_image;
    data['is_checked'] = this.is_checked;
    return data;
  }

}





