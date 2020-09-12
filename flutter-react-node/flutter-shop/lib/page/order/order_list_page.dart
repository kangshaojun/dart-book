//page/order/order_list_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/order_model.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'dart:convert';
//订单列表页面
class OrderListPage extends StatefulWidget{

  OrderListPage();

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  //订单数据列表
  List<OrderModel> _list = [];
  @override
  void initState() {
    super.initState();
    //初始化数据
    this._initData();
  }

  //初始化数据
  _initData() async {
    //读取本地用户信息
    var user = await TokenUtil.getUserInfo();
    //请求参数
    var param = {
      //用户Id
      'user_id':user['id'],
    };
    //发起请求获取用户的订单列表数据
    var response = await HttpService.get(ApiUrl.ORDER_LIST,param: param);
    print(response['data']);
    this.setState(() {
      //将Json数据转换成订单列表数据模型
      _list = OrderListModel.fromJson(response['data']).list;
    });
  }

  @override
  Widget build(BuildContext context) {
    //我的订单页面
    return Scaffold(
      appBar: AppBar(
        //我的订单
        title: Text(KString.MY_ORDER),
        centerTitle: true,
      ),
      //容器
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        //订单列表
        child: ListView.builder(
          //列表项个数
          itemCount: _list.length,
          //渲染列表项
          itemBuilder: (BuildContext context, int index){
            //返回列表项
            return _orderItem(_list[index]);
        },
      ),
      ),
    );
  }

  //列表项 传入订单数据
  Widget _orderItem(OrderModel order){
    //每个订单可能包含多个商品 定义商品列表
    List<OrderGoodModel> _goods_list = [];
    //将订单商品数据解析成列表
    List list = json.decode(order.goods);
    //循环将Json数据转换成订单商品数据模型 然后添加至列表里
    list.forEach((v){
      _goods_list.add(OrderGoodModel.fromJson(v));
    });

    //订单列表项容器
    return Card(
      //点击按钮
      child: InkWell(
        //点击跳转至订单详情页
        onTap: () => _goOrderDetail(order),
        //容器
        child: Container(
          margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
          //垂直布局
          child: Column(
            //水平向左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: ScreenUtil.instance.setHeight(80.0),
                //用户名及手机号
                child: Text(
                  order.username + ":" + order.mobile,
                  style: TextStyle(
                    color: KColor.ORDER_ITEM_TEXT_COLOR,
                    fontSize: ScreenUtil.instance.setSp(26.0),
                  ),
                ),
              ),
              //订单商品列表
              ListView.builder(
                shrinkWrap: true,
                //商品个数
                itemCount:_goods_list.length,
                //不允许滚动
                physics: NeverScrollableScrollPhysics(),
                //列表项渲染
                itemBuilder: (BuildContext context, int index){
                  //返回某项商品
                  return _goodItem(_goods_list[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //跳转至订单详情页面
  _goOrderDetail(OrderModel order){
    RouterUtil.toOrderInfoPage(context,order);
  }

  //订单商品
  Widget _goodItem(OrderGoodModel good){
    //容器
    return Container(
      //水平布局
      child: Row(
        //垂直居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //商品图片
          Image.network(
            good.good_image ?? "",
            width: ScreenUtil.getInstance().setWidth(160.0),
            height:ScreenUtil.getInstance().setHeight(160.0),
          ),
          //商品名称容器
          Container(
            //设置左右外边距
            margin: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(20.0),
              right: ScreenUtil.instance.setHeight(20.0),
            ),
            //商品名称
            child: Text(
              good.good_name.substring(0,10),
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(26.0),
                color: KColor.ORDER_ITEM_TEXT_COLOR,
              ),
            ),
          ),
          Expanded(
              //商品价格和数量容器
              child: Container(
                //右边居中对齐
                alignment: Alignment.centerRight,
                //设置在右外边距
                margin: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(20.0),
                  right: ScreenUtil.instance.setHeight(20.0),
                ),
                //垂直布局
                child: Column(
                  children: <Widget>[
                    //商品价格
                    Text(
                      "￥${good.good_price}",
                      style: TextStyle(
                        color: KColor.ORDER_ITEM_TEXT_COLOR,
                        fontSize: ScreenUtil.instance.setSp(24.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(20.0),
                      ),
                    ),
                    //商品数量
                    Text(
                      "X${good.good_count}",
                      style: TextStyle(
                        color: KColor.ORDER_ITEM_TEXT_COLOR,
                        fontSize: ScreenUtil.instance.setSp(24.0),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}