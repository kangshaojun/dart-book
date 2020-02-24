//widgets/item_text_widget.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//文本组件
class ItemTextWidget extends StatelessWidget {
  //左侧文本
  var leftText;
  //右侧文本
  var rightText;
  //回调方法
  VoidCallback callback;
  //构造方法,回调方法为可选参数
  ItemTextWidget(this.leftText, this.rightText, {this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //点击回调
      onTap: () {
        callback();
      },
      child: Container(
        //左右内边距
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20.0),
            right: ScreenUtil.instance.setWidth(20.0)),
        height: ScreenUtil.instance.setHeight(80.0),
        //水平布局
        child: Row(
          children: <Widget>[
            //左侧文本
            Text(
              leftText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              //右侧文本
              child: Text(
                rightText,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
