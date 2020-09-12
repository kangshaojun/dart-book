//page/home/home_banner.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//首页轮播图组件
class HomeBannder extends StatelessWidget {
  //轮播图数据列表
  List<HomeBannerModel> _banners;
  //构造函数
  HomeBannder(this._banners);

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      //背景色
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      //轮播组件
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          //点击组件
          return InkWell(
            //轮播图
            child: Image.network(
              "${_banners[index].image}",
              //平铺填充
              fit: BoxFit.cover,
            ),
          );
        },
        //图片数量
        itemCount: _banners.length,
        //分页器
        pagination: SwiperPagination(),
        //自动播放
        autoplay: true,
      ),
    );
  }
}
