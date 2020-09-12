//page/home/home_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/page/home/home_good.dart';
import 'package:flutter_shop/page/home/home_banner.dart';
import 'package:flutter_shop/page/home/home_category.dart';


class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  //仿止刷新处理 保持当前状态
  @override
  bool get wantKeepAlive => true;

  //首页内容数据
  HomeContentModel _homeModel;

  @override
  void initState() {
    super.initState();
    print('首页刷新了...');
    this._initData();
  }

  //初始化数据
  _initData() async {
    //请求首页数据
    var response = await HttpService.get(ApiUrl.HOME_CONTENT);
    this.setState(() {
      //将Json数据转换成首页数据模型
      _homeModel = HomeContentModel.fromJson(response['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //首页
    return Scaffold(
      //背景颜色
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        //标题
        title: Text(KString.HOME_TITLE),
      ),
      body: _homeModel == null
        ? Container() :
      //列表视图
      ListView(
        children: <Widget>[
          //首页轮播图
          HomeBannder(_homeModel.banners),
          //首页分类
          HomeCategory(_homeModel.category),
          //首页商品
          HomeGood(_homeModel.goods),
        ],
      ),
    );
  }

}



