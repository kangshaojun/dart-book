//page/order/fill_in_order_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/fill_in_order_model.dart';
import 'package:shop/widgets/item_text_widget.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/utils/fluro_convert_util.dart';
import 'package:shop/utils/toast_util.dart';
import 'package:shop/widgets/cached_image_widget.dart';
import 'package:shop/service/cart_service.dart';
import 'package:shop/service/order_service.dart';
//填写订单页面
class FillInOrderPage extends StatefulWidget {
  //购物车Id
  var cartId;
  //构造方法,传入购物车Id
  FillInOrderPage(this.cartId);

  @override
  _FillInOrderPageState createState() => _FillInOrderPageState();
}

class _FillInOrderPageState extends State<FillInOrderPage> {
  //填写订单数据模型
  FillInOrderModel _fillInOrderModel;
  //订单数据服务
  OrderService _orderService = OrderService();
  //购物车数据服务
  CartService _cartService = CartService();
  //文本编辑控制器
  TextEditingController _controller = TextEditingController();
  //Token值
  var token;
  //填写订单的Futurre对象
  Future fillInOrderFuture;
  //Dio的Options对象
  Options options = Options();

  @override
  void initState() {
    super.initState();
    //获取Token值
    SharedPreferencesUtil.getToken().then((onValue) {
      token = onValue;
      //获取购物车勾选的数据
      _getFillInOrder();
    });
  }

  //获取购物车勾选的数据
  _getFillInOrder() {
    var parameters = {
      //购物车Id
      "cartId": widget.cartId == 0 ? 0 : widget.cartId,
      //地址Id
      "addressId": 0,
    };
    //获取购物车勾选的数据
    fillInOrderFuture = _cartService.getCartDataForFillInOrder((success) {
      setState(() {
        _fillInOrderModel = success;
      });
    }, (error) {}, parameters);
  }

  @override
  Widget build(BuildContext context) {
    //异步构建组件
    return FutureBuilder(
        future: fillInOrderFuture,
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          switch (asyncSnapshot.connectionState) {
            case ConnectionState.none:
            //等待状态
            case ConnectionState.waiting:
              return Container(
                child: Center(
                  //等待状态组件
                  child: SpinKitFoldingCube(
                    size: 40.0,
                    color: KColor.watingColor,
                  ),
                ),
              );
            default:
              if (asyncSnapshot.hasError)
                return Container(
                  child: Center(
                    //异常信息
                    child: Text(
                      KString.SERVER_EXCEPTION,
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(26.0),
                      ),
                    ),
                  ),
                );
              else
                //返回订单内容
                return _contentWidget();
          }
        });
  }

  //订单内容
  _contentWidget() {
    return Scaffold(
      appBar: AppBar(
        //填写订单标题
        title: Text(KString.FILL_IN_ORDER),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //收货地址
            _addressWidget(),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //备注
            _remarkWidget(),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //总价
            ItemTextWidget(
                KString.GOODS_TOTAL, "¥${_fillInOrderModel.goodsTotalPrice}"),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey,
            ),
            //运费
            ItemTextWidget(
                KString.FREIGHT, "¥${_fillInOrderModel.freightPrice}"),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //购物车选中的商品
            Column(
              children: _goodsItems(_fillInOrderModel.checkedGoodsList),
            )
          ],
        ),
      ),
      //底部组件
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
          height: ScreenUtil.instance.setHeight(100.0),
          child: Row(
            children: <Widget>[
              //实付价格
              Expanded(
                  child: Text("实付：¥${_fillInOrderModel.orderTotalPrice}")),
              InkWell(
                //提交订单
                onTap: () => _submitOrder(),
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.instance.setWidth(200.0),
                  height: double.infinity,
                  color: KColor.buyButtonColor,
                  child: Text(
                    //付款标题
                    KString.PAY,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(28.0)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //商品列表
  List<Widget> _goodsItems(List<CheckedGoodsModel> goods) {
    List<Widget> list = List();
    //循环添加所有商品,用户可能挑选了多件商品
    for (int i = 0; i < goods.length; i++) {
      list.add(_goodsItem(goods[i]));
      list.add(Divider(
        height: ScreenUtil.instance.setHeight(1.0),
        color: Colors.grey[350],
      ));
    }
    return list;
  }

  //商品列表项
  Widget _goodsItem(CheckedGoodsModel checkedGoods) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      height: ScreenUtil.instance.setHeight(180.0),
      //水平布局
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //商品图片
          CachedImageWidget(ScreenUtil.instance.setWidth(140),
              ScreenUtil.instance.setWidth(140), checkedGoods.picUrl),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
          ),
          //垂直布局
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //商品名称
              Text(
                checkedGoods.goodsName,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              //商品规格
              Text(
                checkedGoods.specifications[0],
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil.instance.setSp(22.0)),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(20.0))),
              //商品单价
              Text(
                "¥${checkedGoods.price}",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              )
            ],
          ),
          //商品数量
          Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text("X${checkedGoods.number}"),
              ),
          ),
        ],
      ),
    );
  }

  //备注组件
  Widget _remarkWidget() {
    return Container(
      height: ScreenUtil.instance.setHeight(80),
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0),
      ),
      //水平布局
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            //备注标签
            KString.REMARK,
            style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil.instance.setSp(26.0)),
          ),
          //左侧间距
          Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(10.0)
                ),
                height: ScreenUtil.instance.setHeight(80.0),
                alignment: Alignment.centerLeft,
            //备注
            child: TextField(
              maxLines: 1,
              //输入框装饰器
              decoration: InputDecoration(
                //提示填写备注
                hintText: KString.REMARK,
                hintStyle: TextStyle(
                    color: Colors.grey[350],
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                hasFloatingPlaceholder: false,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenUtil.instance.setHeight(1.0))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenUtil.instance.setHeight(1.0))),
              ),
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
              controller: _controller,
            ),
          ))
        ],
      ),
    );
  }

  //地址组件
  Widget _addressWidget() {
    return Container(
      height: ScreenUtil.instance.setHeight(120.0),
      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
      padding: EdgeInsets.only(
          left: ScreenUtil.instance.setWidth(20.0),
          right: ScreenUtil.instance.setWidth(20.0)),
      child: _fillInOrderModel.checkedAddress.id != 0
          ? InkWell(
              onTap: () {
                //跳转至地址页面,返回后获取地址信息
                NavigatorUtil.goAddress(context).then((value) {
                  print(value.toString());
                  Map<String, dynamic> addressData = Map();
                  //根据导航返回的地址数据转换成Map
                  addressData = FluroConvertUtil.stringToMap(value);
                  setState(() {
                    //将返回地址数据转换成实体对象
                    _fillInOrderModel.checkedAddress = CheckedAddressModel.fromJson(addressData);
                  });
                });
              },
              //地址信息水平布局
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //联系人名称
                          Text(
                            _fillInOrderModel.checkedAddress.name,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(28.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setHeight(20.0)),
                          ),
                          //联系人电话
                          Text(
                            _fillInOrderModel.checkedAddress.tel,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(26.0)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil.instance.setHeight(10.0)),
                      ),
                      //联系人地址信息
                      Text(
                        _fillInOrderModel.checkedAddress.province +
                            _fillInOrderModel.checkedAddress.city +
                            _fillInOrderModel.checkedAddress.county +
                            _fillInOrderModel.checkedAddress.addressDetail,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(26.0)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      //右侧箭头,提示可以选择地址
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              //点击跳转至收货地址页面
              onTap: () {
                NavigatorUtil.goAddress(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //选择地址标题
                  Text(
                    KString.PLEASE_SELECT_ADDRESS,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(30.0)),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ))
                ],
              ),
            ),
    );
  }

  //提交订单
  _submitOrder() {
    if (_fillInOrderModel.checkedAddress.id == 0) {
      //请选择地址提示
      ToastUtil.showToast(KString.PLEASE_SELECT_ADDRESS);
      return;
    }
    var parameters = {
      //购物车Id
      "cartId": 0,
      //地址Id
      "addressId": _fillInOrderModel.checkedAddress.id,
      //备注
      "message": _controller.text,
    };
    //提交订单
    _orderService.submitOrder(options, parameters, (success) {
      print(success);
      //提交成功后跳转至订单页面
      NavigatorUtil.goOrder(context);
    }, (error) {
      ToastUtil.showToast(error);
    });
  }
}
