//model/category_good_model.dart文件
//分类商品数据列表模型
class CategoryGoodListModel{

  //商品数据列表
  List<CategoryGoodModel> list = [];

  //构造函数
  CategoryGoodListModel({this.list});

  //取Json数据
  CategoryGoodListModel.fromJson(Map<String,dynamic> json){
    if(json['list'] != null){
      list = new List<CategoryGoodModel>();
      json['list'].forEach((v){
        list.add(CategoryGoodModel.fromJson(v));
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

//分类商品数据模型
class CategoryGoodModel{
  //Id
  int id;
  //名称
  String name;
  //价格
  int price;
  //折扣价
  int discount_price;
  //编号
  int good_sn;
  //图片
  String images;
  //数量
  int count;

  //构造函数
  CategoryGoodModel({this.id,this.name,this.price,this.discount_price,this.good_sn,this.images,this.count});

  //取Json数据
  CategoryGoodModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount_price = json['discount_price'];
    good_sn = json['good_sn'];
    images = json['images'];
    count = json['count'];
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discount_price;
    data['good_sn'] = this.good_sn;
    data['images'] = this.images;
    data['count'] = this.count;
    return data;
  }

}


