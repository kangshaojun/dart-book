//page/home/home_good.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/color_util.dart';
import 'package:flutter_shop/utils/router_util.dart';
//首页商品列表组件
class HomeGood extends StatefulWidget {
  //商品列表数据
  List<HomeGoodModel> _goodList = [];
  //构造函数
  HomeGood(this._goodList);

  @override
  _HomeGoodState createState() => _HomeGoodState();
}

class _HomeGoodState extends State<HomeGood> {

  @override
  Widget build(BuildContext context) {
    //设备宽度
    double width = MediaQuery.of(context).size.width;
    //容器
    return Container(
      width: width,
      color: Colors.white,
      //内边距
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      //商品列表
      child: _goodList(context, width, this.widget._goodList),
    );;
  }

  //返回商品列表
  Widget _goodList(BuildContext context, double deviceWidth, List<HomeGoodModel> productList) {
    //Item宽度
    double itemWidth = deviceWidth * 168.5 / 360;
    //图片宽度
    double imageWidth = deviceWidth * 110.0 / 360;

    //返回商品列表
    List<Widget> listWidgets = productList.map((item) {
      //转换颜色
      var bgColor = ColorUtil.string2Color('#f8f8f8');
      //返回商品列表
      return InkWell(
        onTap: () {
          //路由跳转至商品详情页
          RouterUtil.toGoodDetailPage(context,item.id.toString());
        },
        //商品内容展示容器
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: bgColor,
          //垂直布局
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //商品名称
              Text(
                item.name.length > 8 ? item.name.substring(0,8) : item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
              //商品描述
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              //商品图片
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(
                  item.images.split(',')[0],
                  width: imageWidth,
                  height: imageWidth,
                ),
              ),
              Row(
                  children: <Widget>[
                    //折扣价
                    Text(
                      '￥${item.discount_price}',
                      style: TextStyle(color: KColor.PRICE_TEXT_COLOR),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    //原价
                    Text(
                      '￥${item.price}',
                      style: KFont.PRICE_STYLE,
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    }).toList();

    //标题及商品列表
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //标题容器
        Container(
          //上下内边距
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          //居中对齐
          alignment: Alignment.center,
          //标题
          child: Text(
            KString.NEW_GOOD_TITLE,
            style: TextStyle(color: KColor.HOME_SUB_TITLE_COLOR),
          ),
        ),
        //流式布局列表
        Wrap(
          spacing: 2,
          children: listWidgets,
        ),
      ],
    );
  }
}
