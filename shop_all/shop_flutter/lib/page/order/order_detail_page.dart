//page/order/order_detail_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/service/order_service.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/item_text_widget.dart';
import 'package:shop/model/order_detail_model.dart';
import 'package:shop/widgets/divider_line_widget.dart';
import 'package:shop/widgets/no_data_widget.dart';
import 'package:shop/utils/toast_util.dart';
//订单详情页面
class OrderDetailPage extends StatefulWidget {
  //订单Id
  var orderId;
  //Token值
  var token;
  //构造方法,传入订单Id及Token值
  OrderDetailPage(this.orderId, this.token);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  //订单数据服务
  OrderService _orderService = OrderService();
  //订单详情数据模型
  OrderDetailModel _orderDetailModel;
  //订单详情Future对象
  Future _orderDetailFuture;
  //订单动作,删除订单/取消订单
  var orderAction;
  //订单参数
  var parameters;

  @override
  void initState() {
    super.initState();
    //订单Id参数
    parameters = {"orderId": widget.orderId};
    _queryOrderDetail();
  }

  //查询订单详情数据
  _queryOrderDetail() {
    _orderDetailFuture =
        _orderService.queryOrderDetail(parameters,(success) {
      _orderDetailModel = success;
    }, (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //订单详情标题
        title: Text(KString.MINE_ORDER_DETAIL),
        centerTitle: true,
      ),
      //异步构建组件
      body: FutureBuilder(
          future: _orderDetailFuture,
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            //连接状态
            switch (asyncSnapshot.connectionState) {
              case ConnectionState.none:
              //等待状态
              case ConnectionState.waiting:
                return Container(
                  child: Center(
                    //旋转组件
                    child: SpinKitFoldingCube(
                      size: 40.0,
                      color: KColor.watingColor,
                    ),
                  ),
                );
              default:
                //错误提示
                if (asyncSnapshot.hasError) {
                  return Container(
                    height: double.infinity,
                    //没有数据组件
                    child: NoDataWidget(),
                  );
                } else {
                  //内容展示
                  return _contentWidget();
                }
            }
          }),
    );
  }
  //内容组件
  Widget _contentWidget() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
      //垂直布局
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //订单编号
          ItemTextWidget(KString.MINE_ORDER_SN, _orderDetailModel.orderInfo.orderSn),
          //分割线组件
          DividerLineWidget(),
          //订单创建时间
          ItemTextWidget(KString.MINE_ORDER_TIME, _orderDetailModel.orderInfo.addTime),
          DividerLineWidget(),
          Container(
              margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
              height: ScreenUtil.instance.setHeight(80.0),
              alignment: Alignment.centerLeft,
              //水平布局
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //商品信息
                  Text(
                    KString.ORDER_INFORMATION,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26)),
                  ),
                  //已取消订单提示
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          //是否显示已取消文本
                          child: Offstage(
                            offstage: _orderDetailModel.orderInfo.handleOption.cancel,
                            child: Text(
                              //已取消文本提示
                              KString.MINE_ORDER_ALREADY_CANCEL,
                              style: TextStyle(
                                  color: KColor.defaultTextColor,
                                  fontSize: ScreenUtil.instance.setSp(26.0)),
                            ),
                          )))
                ],
              )),
          DividerLineWidget(),
          //渲染商品列表数据
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //订单商品个数
              itemCount: _orderDetailModel.orderGoods.length,
              //构建商品列表项
              itemBuilder: (BuildContext context, int index) {
                return _goodItemWidget(_orderDetailModel.orderGoods[index]);
              }),
          DividerLineWidget(),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(20.0),
                top: ScreenUtil.instance.setHeight(20.0),
                bottom: ScreenUtil.instance.setHeight(20.0)),
            //垂直布局
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //水平布局
                Row(
                  children: <Widget>[
                    //收货人
                    Text(
                      _orderDetailModel.orderInfo.consignee,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0)),
                    ),
                    //手机信息
                    Text(
                      _orderDetailModel.orderInfo.mobile,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(20.0))),
                //收货地址信息
                Text(
                  _orderDetailModel.orderInfo.address,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                  softWrap: true,
                ),
              ],
            ),
          ),
          DividerLineWidget(),
          //订单商品合计价格
          ItemTextWidget(KString.MINE_ORDER_DETAIL_TOTAL,
              KString.DOLLAR + "${_orderDetailModel.orderInfo.goodsPrice}"),
          DividerLineWidget(),
          //订单运费
          ItemTextWidget(KString.FREIGHT,
              KString.DOLLAR + "${_orderDetailModel.orderInfo.freightPrice}"),
          DividerLineWidget(),
          //订单实付价格
          ItemTextWidget(KString.MINE_ORDER_DETAIL_PAYMENTS,
              KString.DOLLAR + "${_orderDetailModel.orderInfo.actualPrice}"),
          DividerLineWidget(),
          Container(
            height: ScreenUtil.instance.setHeight(100.0),
            child: Row(
              children: <Widget>[
                //取消订单
                Expanded(
                    child: MaterialButton(
                  color: KColor.defaultButtonColor,
                  //点击回调
                  onPressed: () {
                    //动作类型1
                    orderAction = 1;
                    _showDialog();
                  },
                  child: Text(
                    //取消文本
                    KString.CANCEL,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(28.0),
                        color: Colors.white),
                  ),
                )),
                Padding(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(60.0)),
                ),
                //删除订单
                Expanded(
                    child: MaterialButton(
                  color: KColor.defaultButtonColor,
                  //点击处理
                  onPressed: () {
                    //动作类型2
                    orderAction = 2;
                    _showDialog();
                  },
                  child: Text(
                    //删除按钮文本
                    KString.DELETE,
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(28.0),
                        color: Colors.white),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  //商品组件
  Widget _goodItemWidget(OrderDetailGoodsModel good) {
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
            //垂直布局
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
                        top: ScreenUtil.instance.setHeight(10.0),
                    ),
                ),
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
            //垂直布局
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

  //弹出操作对话框
  _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //提示文本
            title: Text(
              KString.TIPS,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            //取消或删除提示文本
            content: Text(
              orderAction == 1
                  ? KString.MINE_ORDER_CANCEL_TIPS
                  : KString.MINE_ORDER_DELETE_TIPS,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            //动作按钮
            actions: <Widget>[
              //取消按钮
              FlatButton(
                  color: Colors.white,
                  //页面返回
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    KString.CANCEL,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(24.0)),
                  )),
              //确认按钮
              FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    //取消订单
                    if (orderAction == 1) {
                      _cancelOrder();
                    } else {
                      //删除订单
                      _deleteOrder();
                    }
                  },
                  child: Text(
                    KString.CONFIRM,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(24.0)),
                  )),
            ],
          );
        });
  }
  //删除订单
  _deleteOrder() {
    //订单Id参数
    var parameters = {"orderId": widget.orderId};
    _orderService.deleteOrder(parameters, (success) {
      Navigator.of(context).pop(true);
    }, (error) {
      ToastUtil.showToast(error);
    });
  }
  //取消订单
  _cancelOrder() {
    //订单Id参数
    var parameters = {"orderId": widget.orderId};
    _orderService.cancelOrder(parameters,  (success) {
      ToastUtil.showToast(KString.MINE_ORDER_CANCEL_SUCCESS);
      setState(() {
        _orderDetailModel.orderInfo.handleOption.cancel = false;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }
}
