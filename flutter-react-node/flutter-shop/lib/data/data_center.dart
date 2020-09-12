//data/data_center.dart文件
import 'package:flutter_shop/model/cart_model.dart';

//数据中心
class DataCenter{

  //单例对象
  static _DataCenter _instance;

  //获取对象
  static _DataCenter getInstance() {
    if(_instance == null ){
      _instance = _DataCenter();
    }
    return _instance;
  }
}

//数据
class _DataCenter {

  //购物列表对象
  List<CartModel> cartList = [];

}