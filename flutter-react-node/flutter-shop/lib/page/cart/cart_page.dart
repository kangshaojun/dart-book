//page/cart/cart_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/cart//cart_good_item.dart';
import 'package:flutter_shop/page/cart/cart_settle_account.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/component/small_button.dart';
//购物车页面
class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //是否刷新
  bool _refresh = false;
  //是否登录
  bool _isLogin = false;
  //用户Id
  int _userId = 1;

  @override
  void initState() {
    super.initState();
    //重新加载购物车回调函数
    Call.addCallBack(Notify.RELOAD_CART_LIST, _reloadCartList);
    //登录状态回调函数
    Call.addCallBack(Notify.LOGIN_STATUS, this._loginCallBack);
    //判断是否登录
    _checkLogin();
  }

  //判断是否登录
  _checkLogin() async {
    //获取登录状态
    bool login = await TokenUtil.isLogin();
    if (login) {
      _isLogin = true;
      //登录成功 加载数据
      this._initData();
    } else {
      _isLogin = false;
    }
  }

  //登录状态回调
  _loginCallBack(data) {
    //根据返回的数据设置当前页面登录状态
    if (data['isLogin']) {
      this.setState(() {
        _isLogin = true;
        this._initData();
      });
    } else {
      _isLogin = false;
    }
  }

  //重新加载购物车
  _reloadCartList(data) {
    this._initData();
  }

  //初始化数据
  _initData() async {
    //获取用户信息
    var user = await TokenUtil.getUserInfo();
    //设置用户Id
    this.setState(() {
      _userId = user['id'];
    });
    //请求参数
    var param = {
      'user_id': _userId,
    };
    //请求购物车列表接口
    var response = await HttpService.get(ApiUrl.CART_LIST, param: param);
    //判断返回状态码
    if (response != null && response['code'] == 0) {
      //将Json接口转化成购物车列表数据模型
      CartListModel model = CartListModel.fromJson(response['data']);
      //数据中心存放一份购物车数据
      DataCenter.getInstance().cartList = model.list;
      print(response['data']);
      //设置状态 刷新数据
      this.setState(() {
        _refresh = !_refresh;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //购物车
        title: Text(KString.CART_TITLET),
      ),
      //判断登录状态 已登录显示购物车 未登录显示登录按钮
      body: this._isLogin
          ? Stack(
              children: <Widget>[
                //列表视图
                ListView.builder(
                    //列表项个数
                    itemCount: DataCenter.getInstance().cartList.length,
                    //列表项构建器
                    itemBuilder: (context, index) {
                      //返回购物车列表项
                      return CartGoodItem(
                          DataCenter.getInstance().cartList[index]);
                    }),
                //底部结算按钮
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartSettleAccount(),
                ),
              ],
            )
          : Center(
              //登录按钮
              child: KSmallButton(
                  text: KString.LOGIN_TITLE,
                  onPressed: () {
                    //点击跳转至登录页面
                    RouterUtil.toLoginPage(context);
                  }),
            ),
    );
  }
}
