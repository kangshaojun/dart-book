//page/detail/detail_buttons.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/component/medium_button.dart';

//添加至购物车及立即购买按钮
class DetailButtons extends StatelessWidget {
  //商品详情数据
  GoodDetailModel _goodDetailModel = null;

  //构造函数
  DetailButtons(this._goodDetailModel);

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      //水平布局
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(110),
            //居中对齐
            alignment: Alignment.center,
            //购物车图标
            child: Icon(
              Icons.shopping_cart,
              size: 35,
              color: KColor.PRIMARY_COLOR,
            ),
          ),
          //添加至购物车
          KMediumButton(
            text: KString.ADD_TO_CART,
            color: KColor.ADD_TO_CART_COLOR,
            onPressed: () {
              //添加至购物车
              this._addGoodToCart(context);
            },
          ),
          SizedBox(
            width: 20,
            height: 70,
          ),
          //立即购买
          KMediumButton(
            text: KString.BUY_GOOD,
            color: KColor.BUY_NOW_BUTTON_COLOR,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  //添加商品至购物车
  _addGoodToCart(BuildContext context) async {
    //判断是否登录
    bool login = await TokenUtil.isLogin();
    if (!login) {
      //没有登录跳转至登录界面
      RouterUtil.toLoginPage(context);
    } else {
      //获取登录用户信息
      var user = await TokenUtil.getUserInfo();
      var data = {
        //用户Id
        'user_id': user['id'],
        //商品Id
        'good_id': this._goodDetailModel.id,
        //商品数量
        'good_count': 1,
        //商品名称
        'good_name': this._goodDetailModel.name,
        //商品价格
        'good_price': this._goodDetailModel.price,
        //商品图片
        'good_image': this._goodDetailModel.images.split(',')[0],
      };
      //调用添加商品至购物车接口
      var response = await HttpService.post(ApiUrl.CART_ADD, param: data);
      if (response['code'] == 0) {
        //添加成功
        MessageWidget.show(KString.ADD_SUCCESS);
        //派发消息 重新加载购物车列表
        Call.dispatch(Notify.RELOAD_CART_LIST);
      }
    }
  }
}
