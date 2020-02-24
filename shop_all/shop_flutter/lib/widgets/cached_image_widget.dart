//widgets/cached_image_widget.dart文件
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/string.dart';
//缓存图片组件
class CachedImageWidget extends StatelessWidget {
  //宽度
  double width;
  //高度
  double height;
  //图片地址
  String url;
  //构造方法
  CachedImageWidget(this.width, this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      //使用CachedNetworkImage组件
      child: CachedNetworkImage(
        //图片地址
        imageUrl: this.url,
        //填充方式
        fit: BoxFit.cover,
        width: this.width,
        height: this.height,
        //等待提示
        placeholder: (BuildContext context, String url) {
          return Container(
            width: this.width,
            color: Colors.grey[350],
            height: this.height,
            alignment: Alignment.center,
            //加载中
            child: Text(
              KString.LOADING,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}