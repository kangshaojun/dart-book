//page/order/order_info_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/order_model.dart';
import 'dart:convert';
import 'package:flutter_shop/config/index.dart';
//订单详情页面
class OrderInfoPage extends StatefulWidget{
  //订单数据
  OrderModel _orderModel;
  //构造函数
  OrderInfoPage(this._orderModel);

  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {

  @override
  Widget build(BuildContext context) {
    //订单详情页
    return Scaffold(
      appBar: AppBar(
        //订单详情
        title: Text(KString.ORDER_DETAIL),
      ),
      //滚动视图
      body: SingleChildScrollView(
        //垂直布局
        child: Column(
          children: <Widget>[
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //总价
            ListTile(title: Text(KString.ALL_PRICE),trailing: Text("￥${widget._orderModel.pay}")),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey,
            ),
            //运费
            ListTile(title: Text(KString.EXPRESS),trailing: Text("￥${widget._orderModel.express}")),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //姓名
            ListTile(title: Text(KString.USERNAME),trailing: Text(widget._orderModel.username)),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //电话
            ListTile(title: Text(KString.MOBILE),trailing: Text(widget._orderModel.mobile)),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //地址
            ListTile(title: Text(KString.ADDRESS),trailing: Text(widget._orderModel.address)),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //垂直布局
            Column(
              //商品列表
              children:_goodsItems(),
            ),
          ],
        ),
      ),
    );
  }

  //商品列表
  List<Widget> _goodsItems(){
    //商品列表数组
    List<OrderGoodModel> _goods_list = [];
    //获取订单中的商品
    String goods = widget._orderModel.goods;
    //Json解码
    List tmpList = json.decode(goods);
    //循环迭代列表并将Json数据转化成数据模型
    tmpList.forEach((v){
      _goods_list.add(OrderGoodModel.fromJson(v));
    });

    //循环迭代商品列表
    List<Widget> list = List();
    for(int i = 0; i< _goods_list.length; i++){
      //添加商品组件至列表里
      list.add(_goodsItem(_goods_list[i]));
      //添加分割线至列表里
      list.add(Divider(
        height: ScreenUtil.instance.setHeight(1.0),
        color: Colors.grey[350],
      ),);
    }
    return list;
  }

  //商品组件
  Widget _goodsItem(OrderGoodModel good){
    //容器
    return Container(
      //左右内边距
      padding: EdgeInsets.only(
        left: ScreenUtil.instance.setWidth(20.0),
        right: ScreenUtil.instance.setWidth(20.0),
      ),
      height: ScreenUtil.instance.setHeight(180.0),
      //水平布局
      child: Row(
        //垂直方向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //商品图片容器
          SizedBox(
            width: ScreenUtil().setWidth(120),
            height: ScreenUtil().setHeight(120),
            //商品图片
            child: Image.network(good.good_image,fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
          ),
          //垂直布局
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //商品名称
              Text(
                good.good_name.substring(0,10),
                style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil.instance.setHeight(6.0),
                ),
              ),
              //商品价格
              Text(
                "￥${good.good_price}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil.instance.setSp(26.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              //商品数量
              child: Text(
                "X${good.good_count}",
              ),
            )
          ),
        ],
      ),
    );
  }

}