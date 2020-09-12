//model/cart_model.dart文件
//购物车列表数据模型
class CartListModel{
  //购物车列表
  List<CartModel> list;
  //构造函数
  CartListModel({this.list});

  //取Json数据
  CartListModel.fromJson(Map<String,dynamic> json){
    if(json['list'] != null){
      list = List<CartModel>();
      json['list'].forEach((v){
        list.add(CartModel.fromJson(v));
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

//购物车数据模型
class CartModel{
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
  CartModel({this.id,this.user_id,this.good_id,this.good_count,this.good_name,this.good_price,this.good_image,this.is_checked});

  //取Json数据
  CartModel.fromJson(Map<String,dynamic> json){
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




