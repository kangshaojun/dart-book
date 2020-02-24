//page/goods/goods_detail_gallery.dart文件
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/cached_image_widget.dart';
//商品详情主图轮播组件
class GoodsDetailGalleryWidget extends StatelessWidget {
  //轮播图数据
  List<String> galleryData = List();
  //数量
  int size;
  //视图高度
  double viewHeight;
  //构造方法,传入轮播图数据,数量以及视图高度
  GoodsDetailGalleryWidget(this.galleryData, this.size, this.viewHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewHeight,
      child: galleryData == null || galleryData.length == 0
          ? Container(
              height: ScreenUtil.instance.setHeight(200.0),
              color: Colors.grey,
              alignment: Alignment.center,
              //没有数据文本提示
              child: Text(KString.NO_DATA_TEXT),
            )
          : Swiper(
              //轮播图数量
              itemCount: galleryData.length,
              //滚动方向
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: false,
              itemBuilder: (BuildContext buildContext, int index) {
                //缓存图片
                return CachedImageWidget(
                    double.infinity, double.infinity, galleryData[index]);
              },
              //动画时长
              duration: 10000,
              //分页
              pagination: SwiperPagination(
                //小圆点放置底部中间
                alignment: Alignment.bottomCenter,
                //小圆点构建器
                builder: DotSwiperPaginationBuilder(
                    size: 8.0,
                    //圆点默认颜色
                    color: KColor.bannerDefaultColor,
                    //圆点点击颜色
                    activeColor: KColor.bannerActiveColor)),
            ),
    );
  }
}
