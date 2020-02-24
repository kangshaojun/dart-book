//home/home_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import "package:flutter_easyrefresh/easy_refresh.dart";
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:shop/service/home_service.dart';
import 'package:shop/page/home/home_banner.dart';
import 'package:shop/page/home/home_category.dart';
import 'package:shop/config/index.dart';
import 'package:shop/page/home/home_product.dart';
import 'package:shop/model/home_model.dart';
import 'package:shop/utils/toast_util.dart';
import 'package:shop/widgets/loading_dialog_widget.dart';
import 'package:shop/utils/shared_preferences_util.dart';
//首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //首页数据接口服务
  HomeService _homeService = HomeService();
  //首页数据模型
  HomeModel _homeModel;
  //刷新组件控制器
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtil.getToken().then((token){
    });
    //查询首页数据
    _queryHomeData();
  }
  //查询首页数据
  _queryHomeData() {
    _homeService.queryHomeData((success) {
      setState(() {
        _homeModel = success;
      });
      _controller.finishRefresh();
    }, (error) {
      //弹出错误信息
      ToastUtil.showToast(error);
      //结束刷新
      _controller.finishRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    //初始化屏幕适配工具
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        //页面顶部组件
        appBar: AppBar(
          //首页标题
          title: Text(KString.HOME_TITLE),
          centerTitle: true,
          actions: <Widget>[
            //搜索按钮
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: (){},
            )
          ],
        ),
        body: contentWidget());
  }

  Widget contentWidget() {
    return _homeModel == null
        //当没有数据时显示正在加载中
        ? LoadingDialogWidget()
        : Container(
            //数据刷新组件
            child: EasyRefresh(
              //控制器
              controller: _controller,
              //刷新组件头部
              header: BezierCircleHeader(backgroundColor: Colors.redAccent),
              //刷新组件底部
              footer: BezierBounceFooter(backgroundColor: Colors.redAccent),
              enableControlFinishRefresh: true,
              enableControlFinishLoad: false,
              //滚动组件,这样首页可以上下滚动
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //轮播图组件
                      HomeBannerWidget(_homeModel.banner, _homeModel.banner.length,
                          ScreenUtil.instance.setHeight(360.0)),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      //首页分类组件
                      HomeCategoryWidget(_homeModel.channel),
                      Container(
                        height: 40.0,
                        alignment: Alignment.center,
                        child: Text(KString.NEW_PRODUCT),
                      ),
                      //最新产品组件
                      HomeProductWidget(_homeModel.newGoodsList),
                      Container(
                        height: 40.0,
                        alignment: Alignment.center,
                        child: Text(KString.HOT_PRODUCT),
                      ),
                      //最热产品组件
                      HomeProductWidget(_homeModel.hotGoodsList),
                    ],
              )),
              //刷新回调方法
              onRefresh: () async {
                //重新查询首页数据
                _queryHomeData();
                //调用完成刷新方法
                _controller.finishRefresh();
              },
            ),
          );
  }
}
