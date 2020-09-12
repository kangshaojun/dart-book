//component/medium_button.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//中等按钮 如添加至购物车按钮使用
class KMediumButton extends StatelessWidget {
  //按钮文本
  String text;
  //按钮颜色
  Color color;
  //按下回调函数
  Function onPressed;
  //构造函数
  KMediumButton({String text,Function onPressed,Color color}){
    this.text = text;
    this.onPressed = onPressed;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    //容器 界定按钮大小
    return Container(
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(70),
      //按钮
      child: FlatButton(
        //按下回调处理
        onPressed: () async {
          this.onPressed();
        },
        //圆角边框
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        //按钮背景颜色
        color: this.color,
        //按钮文本
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }
}
