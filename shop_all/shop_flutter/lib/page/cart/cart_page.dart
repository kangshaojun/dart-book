//page/cart/cart_page.dart文件
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/model/cart_list_model.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/cart_number_widget.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/utils/toast_util.dart';
import 'package:shop/event/refresh_event.dart';
import 'package:shop/event/cart_number_event.dart';
import 'package:shop/widgets/cached_image_widget.dart';
import 'package:shop/event/login_event.dart';
import 'package:shop/service/cart_service.dart';
//购物车页面
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //购物车数据服务
  CartService _cartService = CartService();
  //购物车列表数据
  List<CartModel> _cartList;
  //购物车列表数据模型
  CartListModel _cartListModel;
  //是否登录
  bool _isLogin = false;
  //是否全选
  bool _isAllCheck = false;
  //总计
  double _totalMoney = 0.0;
  //token
  var token;

  @override
  void initState() {
    super.initState();
    //获取Token判断是否登录
    SharedPreferencesUtil.getToken().then((onValue) {
      if (onValue == null) {
        //未登录提示登录
        setState(() {
          _isLogin = false;
        });
      } else {
        //已登录获取购物车数据
        token = onValue;
        _getCartData(onValue);
      }
    });
  }

  //获取购物车数据
  _getCartData(token) {
    Options options = Options();
    //查询购物车数据
    _cartService.queryCart((cartList) {
      setState(() {
        //是否登录变量置为true
        _isLogin = true;
        _cartListModel = cartList;
        _cartList = _cartListModel.cartList;
      });
      //是否全选
      _isAllCheck = _isCheckedAll();
    }, options: options);
  }

  //监听刷新事件,当用户从商品详情页面点击添加至购物车时会触发刷新事件
  _refreshEvent() {
    eventBus.on<RefreshEvent>().listen((RefreshEvent refreshEvent) => _getCartData(token));
    loginEventBus.on<LoginEvent>().listen((LoginEvent loginEvent) {
      if (loginEvent.isLogin) {
        //刷新购物车数据
        _getCartData(SharedPreferencesUtil.token);
      } else {
        setState(() {
          _isLogin = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //监听刷新事件
    _refreshEvent();
    return Scaffold(
        appBar: AppBar(
          //标题
          title: Text(KString.CART),
          centerTitle: true,
        ),
        //判断当前已登录并且购物车数据不为空
        body: _isLogin && _cartList != null
            ? Container(
                child: _cartList.length != 0
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          //渲染购物车列表数据
                          ListView.builder(
                            //购物车列表项个数
                            itemCount: _cartList.length,
                            //购物车列表项构建器
                            itemBuilder: (BuildContext context, int index) {
                              //根据索引返回列表项
                              return _getCartItemWidget(index);
                            }),
                          Container(
                            height: ScreenUtil.getInstance().setHeight(120.0),
                            decoration: ShapeDecoration(
                                shape: Border(
                                    top: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                    ),
                                ),
                            ),
                            //水平布局
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //全选复选框
                                Checkbox(
                                    value: _isAllCheck,
                                    activeColor: KColor.defaultCheckBoxColor,
                                    //选择改变事件回调
                                    onChanged: (bool) {
                                      //设置是否全选
                                      _setCheckedAll(bool);
                                    }),
                                Container(
                                  width:
                                      ScreenUtil.getInstance().setWidth(200.0),
                                  //全选价格
                                  child: Text(_isAllCheck
                                      ? KString.TOTAL_MONEY + "${_cartListModel.cartTotal.checkedGoodsAmount}"
                                      : KString.TOTAL_MONEY + "${_totalMoney}"),
                                ),
                                Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: ScreenUtil.getInstance().setWidth(30.0),
                                      ),
                                      alignment: Alignment.centerRight,
                                      //结算按钮
                                      child: RaisedButton(
                                        //结算操作
                                        onPressed: () {
                                          //跳转到填写订单页面
                                          _fillInOrder();
                                        },
                                        color: KColor.defaultButtonColor,
                                        child: Text(
                                          //结算标签
                                          KString.SETTLEMENT,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil.getInstance().setSp(26.0)),
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        //垂直布局
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //没有数据图片提示
                            Image.asset(
                              "images/no_data.png",
                              height: 80,
                              width: 80,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                            Text(
                              //没有数据文本提示
                              KString.NO_DATA_TEXT,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: KColor.defaultTextColor
                              ),
                            )
                          ],
                        ),
                      ),
              )
            : Container(
                child: Center(
                  //登录按钮
                  child: RaisedButton(
                    color: KColor.defaultButtonColor,
                    onPressed: () {
                      //跳转至登录页面
                      NavigatorUtil.goLogin(context);
                    },
                    //登录文本
                    child: Text(
                      KString.LOGIN,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.getInstance().setSp(30.0)),
                    ),
                  ),
                ),
              ));
  }

  //跳转至填写订单页面
  _fillInOrder() {
    NavigatorUtil.goFillInOrder(context, 0);
  }

  //根据索引获取购物车项组件
  Widget _getCartItemWidget(int index) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(180.0),
      width: double.infinity,
      child: InkWell(
        //长按打开删除商品对话框
        onLongPress: () => _deleteDialog(index),
        child: Card(
          //水平布局
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //是否勾选此商品
              Checkbox(
                //读取购物车列表数据中当前项的checked值
                value: _cartList[index].checked ?? true,
                activeColor: KColor.defaultCheckBoxColor,
                //改变回调方法
                onChanged: (bool) {
                  _checkCart(index, bool);
                }),
              //缓存商品图片
              CachedImageWidget(
                  ScreenUtil.getInstance().setWidth(140.0),
                  ScreenUtil.getInstance().setWidth(140.0),
                  //商品图片路径
                  _cartList[index].picUrl,
              ),
              //垂直布局
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //商品名称
                  Text(
                    _cartList[index].goodsName,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(24.0),
                        color: Colors.black54),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(10.0),
                      ),
                  ),
                  //商品价格
                  Text(
                    "¥${_cartList[index].price}",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(24.0),
                        color: Colors.grey),
                  )
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //购买商品数量
                  Text(
                    "X${_cartList[index].number}",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.getInstance().setSp(24.0)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(10.0),
                      ),
                  ),
                  //使用购物数量组件
                  CartNumberWidget(_cartList[index].number, (value) {
                    //根据返回的索引及数量更新购物车
                    _updateCart(index, value);
                  }),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  //更新购物车,传入索引及数量
  _updateCart(int index, int number) {
    Options options = Options();
    var parameters = {
      //规格Id
      "productId": _cartList[index].productId,
      //商品Id
      "goodsId": _cartList[index].goodsId,
      //商品数量
      "number": number,
      //id
      "id": _cartList[index].id,
    };
    _cartService.updateCart((success) {
      setState(() {
        _cartList[index].number = number;
      });
    }, (error) {
      ToastUtil.showToast(error);
      cartNumberEventBus.fire(CartNumberEvent(number - 1));
    }, options, parameters);
  }

  //是否勾选商品,传入索引及是否勾选
  _checkCart(int index, bool isCheck) {
    var parameters = {
      //产品Id
      "productIds": [_cartList[index].productId],
      //是否选择
      "isChecked": isCheck ? 1 : 0,
    };
    //调用购物车数据服务方法
    _cartService.cartCheck((success) {
      setState(() {
        _cartListModel = success;
        _cartList = _cartListModel.cartList;
        //重新设置全选状态
        _isAllCheck = _isCheckedAll();
      });
      //计算总价
      _totalMoney = _cartListModel.cartTotal.goodsAmount;
    }, (error) {
      ToastUtil.showToast(error);
    }, parameters);
  }

  //删除对话框
  _deleteDialog(int index) {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            //提示
            title: Text(KString.TIPS),
            //是否确认删除
            content: Text(KString.DELETE_CART_ITEM_TIPS),
            actions: <Widget>[
              //取消按钮
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  KString.CANCEL,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              //删除按钮
              FlatButton(
                onPressed: () {
                  //删除商品
                  _deleteGoods(index);
                },
                child: Text(
                  KString.CONFIRM,
                  style: TextStyle(color: KColor.defaultTextColor),
                ),
              )
            ],
          );
        });
  }

  //根据索引删除购物车商品
  _deleteGoods(int index) {
    //通过索引获取到产品Id
    var parameters = {
      "productIds": [_cartList[index].productId]
    };
    //调用删除商品方法
    _cartService.deleteCart((success) {
      //删除成功提示
      ToastUtil.showToast(KString.DELETE_SUCCESS);
      setState(() {
        //本地列表移除数据
        _cartList.removeAt(index);
      });
      Navigator.pop(context);
    }, (error) {
      ToastUtil.showToast(error);
    }, parameters);
  }

  //判断是否全选
  bool _isCheckedAll() {
    //迭代循环购物车列表所有checked属性,当全部为true时为全选状态
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].checked == null || !_cartList[i].checked) {
        return false;
      }
    }
    return true;
  }

  //设置是否全选/全不选
  _setCheckedAll(bool checked) {
    setState(() {
      _isAllCheck = checked;
      for (int i = 0; i < _cartList.length; i++) {
        _cartList[i].checked = checked;
      }
    });
  }
}
