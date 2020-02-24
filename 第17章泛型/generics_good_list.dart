//generics_good_list.dart文件
void main(){
  //服务端返回的Json数据
  var json = {
    //状态码
    'code':'0',
    //状态信息
    'message':'success',
    //返回数据
    'data':[
    {
      'goodId':'0000001',
      'amount': 666,
      'goodImage': 'http://192.168.2.168/images/1.png',
      'goodPrice': 15999,
      'goodName': "苹果笔记本",
      "goodDetail": "苹果 屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
    },
    {
      'goodId':'0000002',
      'amount': 3000,
      'goodImage': 'http://192.168.2.168/images/2.png',
      'goodPrice': 5999,
      'goodName': "Dell/戴尔笔记本",
      "goodDetail": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
    },
    {
      'goodId':'0000003',
      'amount': 999,
      'goodImage': 'http://192.168.2.168/images/3.png',
      'goodPrice': 23999,
      'goodName': "外星人笔记本",
      "goodDetail": "外星人 全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
    },
  ]};

  //商品信息列表
  GoodsListModel goods = GoodsListModel.fromJson(json);
  print(goods.toJson());

}

//商品列表数据模型
class GoodsListModel{
  //状态码
  String code;
  //状态信息
  String message;
  //商品列表数据,使用泛型
  List<GoodInfo> data;

  //构造方法
  GoodsListModel({this.code,this.message,this.data});

  //命名构造方法
  GoodsListModel.fromJson(Map<String,dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      //商品列表数据,泛型类型为GoodInfo
      data = List<GoodInfo>();
      json['data'].forEach((v){
        data.add(GoodInfo.fromJson(v));
      });
    }
  }

  //转换成Json对象输出
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

//商品信息VO类
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
  GoodInfo({this.goodId,this.amount,this.goodImage,this.goodPrice,this.goodName,this.goodDetail});

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
