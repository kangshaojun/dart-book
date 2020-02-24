//page/order/order_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/widgets/no_data_widget.dart';
import 'package:shop/config/string.dart';
import 'package:shop/service/order_service.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/utils/toast_util.dart';
import 'package:shop/model/order_model.dart';
//我的订单页面
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //订单数据服务
  OrderService _orderService = OrderService();
  //订单列表数据
  List<OrderModel> _orders = List();
  //token值
  var _token;
  //当前页码
  var _page = 1;
  //分页数量
  var _limit = 10;

  @override
  void initState() {
    super.initState();
    //获取本地Token值
    SharedPreferencesUtil.getToken().then((value) {
      _token = value;
      //查询订单
      _orderData();
    });
  }

  //查询我的订单数据
  _orderData() {
    //分页相关参数
    var parameters = {"page": _page, "limit": _limit};
    //调用订单服务查询订单数据
    _orderService.queryOrder(parameters,(success) {
      setState(() {
        _orders = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //我的订单标题
        title: Text(KString.MINE_ORDER),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: _orders.length == 0
            //使用没有数据组件
            ? NoDataWidget()
            //使用ListView渲染订单列表
            : ListView.builder(
                //订单条数
                itemCount: _orders.length,
                //渲染订单
                itemBuilder: (BuildContext context, int index) {
                  //根据索引返回订单项
                  return _orderItemWidget(_orders[index]);
                  // return Text("data");
                }),
      ),
    );
  }

  //订单列表项
  Widget _orderItemWidget(OrderModel order) {
    return Card(
        child: InkWell(
          //点击中转至订单详情页
          onTap: () => _goOrderDetail(order.id),
          child: Container(
            margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
            //垂直布局
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: ScreenUtil.instance.setHeight(80.0),
                  //水平布局
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //订单标题
                      Text(
                        KString.ORDER_TITLE,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(26.0)),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(10.0))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //订单编号
                                  Text(KString.MINE_ORDER_SN + "${order.orderSn}"),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: ScreenUtil.instance.setWidth(40),
                                    color: Colors.grey[350],
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
                //订单商品列表渲染
                ListView.builder(
                    shrinkWrap: true,
                    //订单商品个数
                    itemCount: order.goodsList.length,
                    physics: NeverScrollableScrollPhysics(),
                    //订单商品项
                    itemBuilder: (BuildContext context, int index) {
                      return _goodItemWidget(order.goodsList[index]);
                    }),
                Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(10.0)),
                  alignment: Alignment.centerRight,
                  //商品数量以及总价展示
                  child: Text(KString.MINE_ORDER_TOTAL_GOODS +
                      "${goodNumber(order)}" +
                      KString.MINE_ORDER_GOODS_TOTAL +
                      KString.MINE_ORDER_PRICE +
                      "${order.actualPrice}"),
                )
              ],
            ),
          )));
  }

  //跳转至订单详情
  _goOrderDetail(int orderId) {
    NavigatorUtil.goOrderDetail(context, orderId, _token).then((bool) {
        _orderData();
    });
  }

  //计算商品数量
  int goodNumber(OrderModel order) {
    int number = 0;
    //查询某个订单下的所有商品做累加处理
    order.goodsList.forEach((good) {
      number += good.number;
    });
    return number;
  }

  //订单商品项组件
  Widget _goodItemWidget(OrderGoodsModel good) {
    return Container(
      //水平布局
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //商品图片
          Image.network(
            good.picUrl ?? "",
            width: ScreenUtil.instance.setWidth(160.0),
            height: ScreenUtil.instance.setHeight(160.0),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                top: ScreenUtil.instance.setHeight(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //商品名称
                Text(
                  good.goodsName,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(10.0))),
                //商品规格
                Text(
                  good.specifications[0],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(10.0))),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                right: ScreenUtil.instance.setWidth(20.0),
            ),
            child: Column(
              children: <Widget>[
                //商品价格
                Text(
                  "¥${good.price}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(24.0)),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(20.0))),
                //商品数量
                Text(
                  "X${good.number}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(24.0)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
