//widgets/cart_number_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/event/cart_number_event.dart';

//定义数量改变回调方法
typedef OnNumberChange(int number);

//购物车数量加减组件
class CartNumberWidget extends StatefulWidget {
  //数量改变回调方法
  OnNumberChange onNumberChange;
  //计数
  var _number;
  //构造方法,传入初始值及回调方法
  CartNumberWidget(this._number, this.onNumberChange);

  @override
  _CartNumberWidgetState createState() => _CartNumberWidgetState();
}

class _CartNumberWidgetState extends State<CartNumberWidget> {
  //商品数量
  var goodsNumber;
  //回调方法
  OnNumberChange onNumberChange;

  @override
  void initState() {
    super.initState();
    goodsNumber = widget._number;
    onNumberChange = widget.onNumberChange;
  }
  //监听数量改变事件
  _listener() {
    cartNumberEventBus.on<CartNumberEvent>().listen((CartNumberEvent cartNumberEvent) {
      //设置当前商品数量
      setState(() {
        goodsNumber = cartNumberEvent.number;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //调用事件监听
    _listener();
    return Container(
      //设置宽高
      width: ScreenUtil.instance.setWidth(150),
      height: ScreenUtil.instance.setWidth(50),
      //水平布局
      child: Row(
        children: <Widget>[
          InkWell(
            //减少
            onTap: () => _reduce(),
            child: Container(
              width: ScreenUtil.instance.setWidth(50),
              height: double.infinity,
              alignment: Alignment.center,
              //添加边框样式
              decoration: ShapeDecoration(
                  shape: Border(
                      left: BorderSide(color: Colors.grey, width: 1.0),
                      top: BorderSide(color: Colors.grey, width: 1.0),
                      right: BorderSide(color: Colors.grey, width: 1.0),
                      bottom: BorderSide(color: Colors.grey, width: 1.0))),
              //减少符号
              child: Text(
                "-",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              ),
            )),
          //中间数量容器
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: ScreenUtil.instance.setWidth(50),
            //添加边框样式
            decoration: ShapeDecoration(
                shape: Border(
                    top: BorderSide(color: Colors.grey, width: 1.0),
                    bottom: BorderSide(color: Colors.grey, width: 1.0))),
            //商品数量
            child: Text(
              "${goodsNumber}",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
          ),
          InkWell(
            //增加
            onTap: () => _add(),
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil.instance.setWidth(50),
              height: double.infinity,
              //添加边框样式
              decoration: ShapeDecoration(
                  shape: Border(
                      left: BorderSide(color: Colors.grey, width: 1.0),
                      top: BorderSide(color: Colors.grey, width: 1.0),
                      right: BorderSide(color: Colors.grey, width: 1.0),
                      bottom: BorderSide(color: Colors.grey, width: 1.0))),
              //增加符号
              child: Text(
                "+",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              ),
            )),
        ],
      ),
    );
  }

  //减少处理
  _reduce() {
    //判断当前商品数量是否大于1
    if (goodsNumber > 1) {
      setState(() {
        goodsNumber = goodsNumber - 1;
      });
    }
    print("${widget._number}");
    //调用回调方法
    onNumberChange(goodsNumber);
  }

  //增加处理
  _add() {
    setState(() {
      goodsNumber = goodsNumber + 1;
    });
    print("${goodsNumber}");
    //调用回调方法
    onNumberChange(goodsNumber);
  }
}
