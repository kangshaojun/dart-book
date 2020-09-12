//page/cart/cart_counter.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
//商品计数器组件
class CartCounter extends StatelessWidget {
  //购物车数据
  CartModel _cartModel;
  //构造函数
  CartCounter(this._cartModel);

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      //四周添加边框
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: KColor.BORDER_COLOR),
      ),
      //水平布局
      child: Row(
        children: <Widget>[
          //减少按钮
          _reduceButton(context),
          //商品数量
          _goodCount(),
          //添加按钮
          _addButton(context),
        ],
      ),
    );
  }

  //减少按钮
  Widget _reduceButton(BuildContext context) {
    return InkWell(
      onTap: () {
        //更新购物车商品数量
        this._goodCountUpdate(context,this._cartModel.good_count - 1);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        //居中对齐
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //当前数量小于等于1时,按钮变成灰色
          color: _cartModel.good_count > 1 ? Colors.white : KColor.BORDER_COLOR,
          border: Border(
              right: BorderSide(width: 1, color: KColor.BORDER_COLOR)),
        ),
        child: _cartModel.good_count > 1 ? Text('-') : Text(' '),
      ),
    );
  }

  //增加按钮
  Widget _addButton(BuildContext context) {
    return InkWell(
      onTap: () {
        //更新购物车商品数量
        this._goodCountUpdate(context,this._cartModel.good_count + 1);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        //居中对齐
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              left: BorderSide(width: 1, color: KColor.BORDER_COLOR)),
        ),
        child: Text('+'),
      ),
    );
  }

  //显示数量
  Widget _goodCount() {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      //居中对齐
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${_cartModel.good_count}'),
    );
  }

  //更新购物车商品数量
  _goodCountUpdate (BuildContext context,int count) async{
    //请求参数
    var param = {
      //Id
      'id':this._cartModel.id,
      //商品数量
      'good_count':count,
      //是否选中
      'is_checked':this._cartModel.is_checked,
    };
    //请求更新购物车接口
    var response = await HttpService.post(ApiUrl.CART_UPDATE,param: param);
    if(response['code'] == 0){
      //派发消息 重新加载购物车列表
      Call.dispatch(Notify.RELOAD_CART_LIST);
    }
  }
}
