//object_constructor_init_list.dart文件
void main(){
  //调用构造方法GoodInfo.fromJson实例化商品信息类
  GoodInfo goodInfoJson = GoodInfo.fromJson({
    'goodId':'000002',
    'amount': 666,
    'goodImage':'http://192.168.2.168/images/2.png',
    'goodPrice':688,
    'goodName':'男加厚珊瑚绒翻领开衫套装',
    'goodDetail':'南极人 睡衣男秋冬长袖可外穿法兰绒睡衣家居服男加厚珊瑚绒翻领开衫套装 男经典藏青(上衣+裤子) XL'});

  //打印输出Json数据
  print(goodInfoJson.toJson());
}

//商品信息
class GoodInfo{
  //商品Id
  String goodId;
  //商品数量
  int amount;
  //商品图片
  String goodImage;
  //商品价格
  int goodPrice;
  //商品名称
  String goodName;
  //商品详情
  String goodDetail;

  /*
   * 初始化列表在构造方法体执行前设置实例变量的值
   */
  GoodInfo.fromJson(Map<String,dynamic> json)
      //初始化列表
      : goodId = json['goodId'],
        amount = json['amount'],
        goodImage = json['goodImage'],
        goodPrice = json['goodPrice'],
        goodName = json['goodName'],
        goodDetail = json['goodDetail']{
    print('GoodInfo.fromJson命名构造方法');
  }

  /*
   * 将当前对象转化成Json数据
   */
  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['goodId'] = this.goodId;
    data['amount'] = this.amount;
    data['goodImage'] = this.goodImage;
    data['goodPrice'] = this.goodPrice;
    data['goodName'] = this.goodName;
    data['goodDetail'] = this.goodDetail;
    return data;
  }
}