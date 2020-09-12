//page/cart/cart_settle_account.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/component/circle_check_box.dart';
import 'package:flutter_shop/component/small_button.dart';

//购物结算组件
class CartSettleAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      //水平布局
      child: Row(
        children: <Widget>[
          //全选复选框
          _allCheckBox(context),
          //总价容器
          _allPriceContainer(context),
          //结算按钮
          _settleButton(context),
        ],
      ),
    );
  }

  //全选按钮
  Widget _allCheckBox(BuildContext context) {
    bool isAllCheck = false;
    return Container(
      child: Row(
        children: <Widget>[
          CircleCheckBox(
            value: isAllCheck,
            onChanged: (bool val) {
              //TODO 全选处理
            },
          ),
          //全选
          Text(KString.CHECK_ALL),
        ],
      ),
    );
  }

  //总价容器
  Widget _allPriceContainer(BuildContext context) {
    //总价
    int price = 0;
    //计算总价
    DataCenter.getInstance().cartList.forEach((CartModel item) {
      //判断是否选中
      if (item.is_checked == 1) {
        //统计价格
        price += item.good_price * item.good_count;
      }
    });

    //容器
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      //水平布局
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(200),
            //合计标签
            child: Text(
              KString.ALL_PRICE,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: ScreenUtil().setWidth(230),
            //总价
            child: Text(
              '￥${price}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: KColor.PRICE_TEXT_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //结算按钮
  Widget _settleButton(BuildContext context) {
    //商品数量
    int _goodCount = 0;
    //统计选中的商品数量
    DataCenter.getInstance().cartList.forEach((CartModel item) {
      if (item.is_checked == 1) {
        _goodCount++;
      }
    });
    //结算小按钮
    return KSmallButton(
      text: KString.SETTLE_ACCOUNT + '(${_goodCount})',
      onPressed: () {
        RouterUtil.toWriteOrderPage(context);
      },
    );
  }
}
