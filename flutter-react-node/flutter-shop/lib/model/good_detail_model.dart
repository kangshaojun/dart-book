//model/good_detail_model.dart文件
//商品详情数据模型
class GoodDetailModel{
  //Id
  int id;
  //名称
  String name;
  //价格
  int price;
  //折扣价
  int discount_price;
  //数量
  int count;
  //编号
  int good_sn;
  //运费
  int fright;
  //图片
  String images;
  //详情
  String detail;

  //构造函数
  GoodDetailModel({this.id,this.name,this.price,this.discount_price,this.count,this.good_sn,this.fright,this.images,this.detail});

  //取Json数据
  GoodDetailModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount_price = json['discount_price'];
    count = json['count'];
    good_sn = json['good_sn'];
    fright = json['fright'];
    images = json['images'];
    detail = json['detail'];
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discount_price;
    data['count'] = this.count;
    data['good_sn'] = this.good_sn;
    data['fright'] = this.fright;
    data['images'] = this.images;
    data['detail'] = this.detail;
    return data;
  }

}