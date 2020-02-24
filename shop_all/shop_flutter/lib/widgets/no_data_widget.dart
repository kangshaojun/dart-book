//widgets/no_data_widget.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
//没有数据提示组件
class NoDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      alignment: Alignment.center,
      //居中显示
      child: Center(
        //垂直布局
        child: Column(
          //垂直居中
          mainAxisAlignment: MainAxisAlignment.center,
          //水平居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //图片提示
            Image.asset(
              "images/no_data.png",
              height: ScreenUtil.instance.setWidth(120.0),
              width: ScreenUtil.instance.setWidth(120.0),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil.instance.setHeight(20.0)),
            ),
            //文本提示
            Text(
              KString.NO_DATA_TEXT,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(28.0),
                  color: KColor.defaultTextColor),
            )
          ],
        ),
      ),
    );
  }
}
