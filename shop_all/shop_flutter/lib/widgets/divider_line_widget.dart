//widgets/divider_line_widget.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//分割线组件
class DividerLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      //颜色
      color: Colors.grey[350],
      //高度
      height: ScreenUtil.instance.setHeight(1.0),
    );
  }
}
