//page/cart/cart_good_item.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/cart/cart_counter.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/component/circle_check_box.dart';

//购物车商品列表项
class CartGoodItem extends StatelessWidget {
  //列表项数据
  final CartModel item;

  //构造函数
  CartGoodItem(this.item);

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      //外边距
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      //内边距
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      //边框装饰器
      decoration: BoxDecoration(
        color: Colors.white,
        //添加底部边框
        border: Border(
          bottom: BorderSide(width: 1, color: KColor.BORDER_COLOR),
        ),
      ),
      //水平布局
      child: Row(
        children: <Widget>[
          //复选框
          _cartCheckBox(context, item),
          //商品图片
          _cartGoodImage(item),
          //商品名称
          _cartGoodName(item),
          //商品价格
          _cartGoodPrice(context, item),
        ],
      ),
    );
  }

  //多选择按钮
  Widget _cartCheckBox(BuildContext context, CartModel item) {
    return Container(
      //圆形CheckBox组件
      child: CircleCheckBox(
          //1表示选中 0表示未选中
          value: item.is_checked == 1,
          //选中改变回调函数
          onChanged: (bool val) {
            //更新选中状态
            this._goodCheckedUpdate(context, val ? 1 : 0);
          }),
    );
  }

  //商品图片
  Widget _cartGoodImage(CartModel item) {
    //容器
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      //上下周右添加边框
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: KColor.BORDER_COLOR)),
      //商品图片
      child: Image.network(item.good_image),
    );
  }

  //商品名称
  Widget _cartGoodName(CartModel item) {
    //容器
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      //对齐方式
      alignment: Alignment.topLeft,
      //垂直布局
      child: Column(
        children: <Widget>[
          //商品名称
          Text(
            item.good_name,
            overflow: TextOverflow.ellipsis,
          ),
          //计数器
          CartCounter(item),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartGoodPrice(BuildContext context, CartModel item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      //垂直布局
      child: Column(
        children: <Widget>[
          //商品价格
          Text(
            '￥${item.good_price}',
            style: TextStyle(color: KColor.PRICE_TEXT_COLOR),
          ),
          Container(
            child: InkWell(
              onTap: () {
                //删除商品
                this._goodDelete(context);
              },
              //删除图标
              child: Icon(
                Icons.delete,
                color: KColor.CART_DELETE_ICON_COLOR,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //更新购物车条目
  _goodCheckedUpdate(BuildContext context, int is_checked) async {
    //参数
    var param = {
      //Id
      'id': this.item.id,
      //商品数量
      'good_count': item.good_count,
      //是否选中
      'is_checked': is_checked,
    };
    //调用购物车更新接口
    var response = await HttpService.post(ApiUrl.CART_UPDATE, param: param);
    //将Json数据转换成购物车列表数据模型
    CartListModel model = CartListModel.fromJson(response['data']);
    //设置数据中心购物列表数据
    DataCenter.getInstance().cartList = model.list;
    //派发消息 刷新购物车
    Call.dispatch(Notify.RELOAD_CART_LIST);
  }

  //删除购物车商品
  _goodDelete(BuildContext context) async {
    //参数
    var param = {
      'id': this.item.id,
    };
    //调用购物车删除接口
    var response = await HttpService.post(ApiUrl.CART_DELETE, param: param);
    //将Json数据转换成购物车列表数据模型
    CartListModel model = CartListModel.fromJson(response['data']);
    //设置数据中心购物列表数据
    DataCenter.getInstance().cartList = model.list;
    //派发消息 刷新购物车
    Call.dispatch(Notify.RELOAD_CART_LIST);
  }
}
