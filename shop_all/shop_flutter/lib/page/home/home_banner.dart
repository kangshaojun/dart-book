//home/home_banner.dart文件
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/home_model.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/widgets/cached_image_widget.dart';

//首页轮播图组件
class HomeBannerWidget extends StatelessWidget {
  //轮播图数据
  List<BannerModel> bannerData = List();
  //数量
  int size;
  //视图高度
  double viewHeight;
  //构造方法 传入轮播图数据,大小以及视图高度
  HomeBannerWidget(this.bannerData, this.size, this.viewHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewHeight,
      width: double.infinity,
      child: bannerData == null || bannerData.length == 0
            //没有数据提示
          ? Container(
              height: ScreenUtil.instance.setHeight(400.0),
              color: Colors.grey,
              //居中显示
              alignment: Alignment.center,
              //没有数据文本提示
              child: Text(KString.NO_DATA_TEXT),
            )
          //轮播组件
          : Swiper(
              //点击跳转
              onTap: (index) {
                NavigatorUtil.goWebView(context, bannerData[index].name, bannerData[index].link);
              },
              //轮播图数量
              itemCount: bannerData.length,
              //指定滚动方向
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: false,
              itemBuilder: (BuildContext buildContext, int index) {
                //使用缓存图片组件显示轮播图
                return CachedImageWidget(
                    double.infinity, double.infinity, bannerData[index].url);
              },
              //滚动时长
              duration: 10000,
              //指定分页组件
              pagination: SwiperPagination(
                  //底部居中展示
                  alignment: Alignment.bottomCenter,
                  //构建小圆点
                  builder: DotSwiperPaginationBuilder(
                      size: 8.0,
                      //未点击颜色
                      color: KColor.bannerDefaultColor,
                      //点击颜色
                      activeColor: KColor.bannerActiveColor)),
            ),
    );
  }
}
