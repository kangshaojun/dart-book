//page/detail/detail_info.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
//商品详情页基本信息
class DetailInfo extends StatelessWidget {
  //商品详情数据
  GoodDetailModel _goodDetailModel = null;
  //构造函数
  DetailInfo(this._goodDetailModel);

  @override
  Widget build(BuildContext context) {
    //判断数据是否为空
    if (_goodDetailModel != null) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(2.0),
        //垂直布局
        child: Column(
          children: <Widget>[
            //商品图片
            _goodImage(_goodDetailModel.images.split(',')[0]),
            //商品名称
            _goodName(_goodDetailModel.name),
            //商品编号
            _goodSN(_goodDetailModel.good_sn),
            //商品价格
            _goodPrice(_goodDetailModel.discount_price, _goodDetailModel.price)
          ],
        ),
      );
    } else {
      return Text(KString.LOADING); //'加载中...'
    }
  }

  //商品图片
  Widget _goodImage(url) {
    return Image.network(
      //图片路径
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  //商品名称
  Widget _goodName(name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        //单行显示
        maxLines: 1,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  //商品编号
  Widget _goodSN(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        KString.GOOD_SN + ':${num}',
        style: TextStyle(color: KColor.GOOD_SN_COLOR),
      ),
    );
  }

  //商品价格方法
  Widget _goodPrice(int discount_price, int price) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          //折扣价
          Text(
            '￥${discount_price}',
            style: TextStyle(
              color: KColor.PRICE_TEXT_COLOR,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          //原价
          Text(
            KString.ORI_PRICE + '${price}',
            style: TextStyle(
              color: KColor.OLD_PRICE_COLOR,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
