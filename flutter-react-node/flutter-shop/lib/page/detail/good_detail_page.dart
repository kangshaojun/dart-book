//page/detail/good_detail_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/detail/detail_info.dart';
import 'package:flutter_shop/page/detail/detail_buttons.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_html/flutter_html.dart';
//商品详情页面
class GoodDetailPage extends StatefulWidget {
  //商品Id
  String _goodId;
  //构造函数
  GoodDetailPage(this._goodId);

  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  //商品详情数据
  GoodDetailModel _goodDetailModel = null;

  @override
  void initState() {
    super.initState();
    //初始化数据
    _initData();
  }

  //初始化数据
  _initData() async {
    //请求参数
    var param = {
      'id':widget._goodId,
    };
    //请求商品详情接口
    var response = await HttpService.get(ApiUrl.GOOD_DETAIL,param:param);

    this.setState(() {
      //将Json数据转换成数据模型
      _goodDetailModel = GoodDetailModel.fromJson(response['data']);
    });

  }

  @override
  Widget build(BuildContext context) {
    //安全区域
    return SafeArea(
      //订单详情页
      child: Scaffold(
        appBar: AppBar(
          //返回按钮
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //路由返回
              RouterUtil.pop(context);
            },
          ),
          //标题
          title: Text(KString.GOOD_DETAIL_TITLE),
        ),
        body: (_goodDetailModel != null) ? Stack(
          children: <Widget>[
            //列表视图
            ListView(
              children: <Widget>[
                //详情信息
                DetailInfo(_goodDetailModel),
                //详情Html内容
                Html(data: _goodDetailModel.detail.toString(),),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              //添加至购物车及立即购买按钮
              child: DetailButtons(_goodDetailModel),
            ),
          ],
        ) : Text(KString.LOADING)//'加载中...'
      ),
    );
  }

}



