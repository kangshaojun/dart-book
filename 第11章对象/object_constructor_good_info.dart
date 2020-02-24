//object_constructor_good_info.dart文件
void main(){
  //调用构造方法GoodInfo实例化商品信息类
  GoodInfo goodInfo = GoodInfo(
      '000001',
      999,
      'http://192.168.2.168/images/1.png',
      800,
      '男士夹克外套',
      '外套男秋冬季男装连帽时尚休闲运动套装男士夹克外套男衣服 黑三件套 XL');

  //调用构造方法GoodInfo.fromJson实例化商品信息类
  GoodInfo goodInfoJson = GoodInfo.fromJson({
      'goodId':'000002',
      'amount': 666,
      'goodImage':'http://192.168.2.168/images/2.png',
      'goodPrice':688,
      'goodName':'男加厚珊瑚绒翻领开衫套装',
      'goodDetail':'南极人 睡衣男秋冬长袖可外穿法兰绒睡衣家居服男加厚珊瑚绒翻领开衫套装 男经典藏青(上衣+裤子) XL'});

  //打印输出Json数据
  print(goodInfo.toJson());
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

  //构造方法
//  GoodInfo(String goodId, int amount, String goodImage, double goodPrice, String goodName, String goodDetail){
//    this.goodId = goodId;
//    this.amount = amount;
//    this.goodImage = goodImage;
//    this.goodPrice = goodPrice;
//    this.goodName = goodName;
//    this.goodDetail = goodDetail;
//  }

  //语法糖 简化构造方法
  GoodInfo(this.goodId, this.amount, this.goodImage, this.goodPrice, this.goodName, this.goodDetail);

  /*
   * ClassName.identifier形式构造方法
   * 传入Json数据实例化为GoodInfo对象
   */
  GoodInfo.fromJson(Map<String,dynamic> json){
    goodId = json['goodId'];
    amount = json['amount'];
    goodImage = json['goodImage'];
    goodPrice = json['goodPrice'];
    goodName = json['goodName'];
    goodDetail = json['goodDetail'];
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

