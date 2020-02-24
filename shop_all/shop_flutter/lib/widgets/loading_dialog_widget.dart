//widgets/loading_dialog_widget.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
//加载数据组件
class LoadingDialogWidget extends StatefulWidget {
  @override
  _LoadingDialogWidgetState createState() => _LoadingDialogWidgetState();
}

class _LoadingDialogWidgetState extends State<LoadingDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        //加载数据组件
        child: SpinKitFoldingCube(
          //大小
          size: ScreenUtil.instance.setWidth(60.0),
          //颜色
          color: KColor.watingColor,
        ),
      ),
    );
  }
}
