//object_constructor_redirect.dart文件
void main(){
  //实例化对象 调用重定向构造方法
  GoodInfo goodInfo = GoodInfo.redirect('000003');
  //打印输出Json数据
  print(goodInfo.toJson());
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

  //该类的主构造方法
  GoodInfo(this.goodId, this.amount, this.goodImage, this.goodPrice, this.goodName, this.goodDetail);
  //重定向构造方法 代理到主构造方法
  GoodInfo.redirect(String goodId) : this(goodId,0,'http://192.168.2.168/images/default.png',0,'商品名称','商品详情');

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

