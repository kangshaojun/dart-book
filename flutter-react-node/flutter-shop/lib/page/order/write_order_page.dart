//page/order/write_order_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/config/index.dart';
import 'dart:convert';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/component/medium_button.dart';
//填写订单页面
class WriteOrderPage extends StatefulWidget{

  @override
  _WriteOrderPageState createState() => _WriteOrderPageState();
}

class _WriteOrderPageState extends State<WriteOrderPage> {
  //商品总价
  int _allPrice = 0;
  //用户名
  String _username = '';
  //电话
  String _mobile = '';
  //地址
  String _address = '';
  //用户Id
  int _user_id = 0;

  @override
  void initState() {
    super.initState();
    //初始化数据
    this._initData();
  }

  //初始化数据
  _initData() async {
    //获取数据中心存储的购物车数据
    List<CartModel> cartList = DataCenter.getInstance().cartList;
    int price = 0;
    //计算总价
    cartList.forEach((CartModel item) {
      //提取选中的商品
      if(item.is_checked == 1){
        //统计总价
        price += item.good_price * item.good_count;
      }
    });
    //获取本地用户信息
    var user = await TokenUtil.getUserInfo();
    //更新总价和用户信息数据
    this.setState(() {
      _allPrice = price;
      _username = user['username'];
      _mobile = user['mobile'];
      _address = user['address'];
      _user_id = user['id'];
    });

  }

  @override
  Widget build(BuildContext context) {
    //填写订单页面
    return Scaffold(
      appBar: AppBar(
        //标题
        title: Text(KString.WRITE_ORDER_TITLE),
      ),
      //滚动视图
      body: SingleChildScrollView(
        //垂直布局
        child: Column(
          children: <Widget>[
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //总价
            ListTile(title: Text(KString.ALL_PRICE),trailing: Text("￥${_allPrice}")),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey,
            ),
            //运费
            ListTile(title: Text(KString.EXPRESS),trailing: Text("￥0")),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //姓名
            ListTile(title: Text(KString.USERNAME),trailing: Text(_username)),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //电话
            ListTile(title: Text(KString.MOBILE),trailing: Text(_mobile)),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //地址
            ListTile(title: Text(KString.ADDRESS),trailing: Text(_address)),
            Divider(
              height: ScreenUtil.instance.setHeight(1.0),
              color: Colors.grey[350],
            ),
            //商品列表
            Column(
              children:_goodsItems(),
            ),
          ],
        ),
      ),
      //底部应用按钮
      bottomNavigationBar: BottomAppBar(
        //容器
        child: Container(
          //左右外边距
          margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20.0),
            right: ScreenUtil.instance.setWidth(20.0),
          ),
          height: ScreenUtil.instance.setHeight(100.0),
          //水平布局
          child: Row(
            children: [
              Expanded(
                //价钱
                child: Text(
                    '￥${_allPrice}.00',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
                //提交订单按钮
                KMediumButton(
                  text: KString.SUBMIT_ORDER,
                  color: KColor.SUBMIT_ORDER_BUTTON_COLOR,
                  //点击提交订单
                  onPressed: (){
                    this._submitOrder();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  //商品列表项
  List<Widget> _goodsItems(){
    //从数据中心提取购物车列表
    List<CartModel> cartList = DataCenter.getInstance().cartList;

    //迭代购物车列表
    List<Widget> list = List();
    for(int i = 0; i< cartList.length; i++){
      //选取选中状态的数据
      if(cartList[i].is_checked == 1){
        //添加商品项
        list.add(_goodsItem(cartList[i]));
        //添加分隔线
        list.add(Divider(
          height: ScreenUtil.instance.setHeight(1.0),
          color: Colors.grey[350],
        ),);
      }
    }
    //返回列表
    return list;
  }

  //商品项
  Widget _goodsItem(CartModel good){
    //容器
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.instance.setWidth(20.0),
        right: ScreenUtil.instance.setWidth(20.0),
      ),
      height: ScreenUtil.instance.setHeight(180.0),
      //水平布局
      child: Row(
        //垂直居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //图片容器
          SizedBox(
            width: ScreenUtil().setWidth(120),
            height: ScreenUtil().setHeight(120),
            //商品图片
            child: Image.network(good.good_image,fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
          ),
          //垂直布局
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //商品名称
              Text(
                good.good_name.substring(0,10),
                style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil.instance.setHeight(6.0),
                ),
              ),
              //商品价格
              Text(
                "￥${good.good_price}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil.instance.setSp(26.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              //商品数量
              child: Text(
                "X${good.good_count}",
              ),
            )
          ),
        ],
      ),
    );
  }

  //提交订单
  _submitOrder() async {

    //获取商品列表
    List<CartModel> cartList = DataCenter.getInstance().cartList;

    //提取购物车已选中的商品数据
    List<CartModel> list = List<CartModel>();
    for(int i = 0; i< cartList.length; i++){
      if(cartList[i].is_checked == 1){
        list.add(cartList[i]);
      }
    }
    //将列表数据转换成Json
    var goodJson = list.map((v) => v.toJson()).toList();
    print("序列化:" + goodJson.toString());

    //提交订单参数
    var data = {
      //用户Id
      'user_id':_user_id,
      //用户名
      'username':_username,
      //价格
      'pay':_allPrice,
      //运费
      'express':0,
      //电话
      'mobile':_mobile,
      //地址
      'address':_address,
      //编码后的商品数据
      'goods':json.encode(goodJson),
    };
    //调用添加订单接口 传入提交订单参数
    var response = await HttpService.post(ApiUrl.ORDER_ADD,param: data);
    if(response['code'] == 0){
      //返回成功后跳转至订单列表页面
      RouterUtil.toOrderListPage(context);
    }
  }

}