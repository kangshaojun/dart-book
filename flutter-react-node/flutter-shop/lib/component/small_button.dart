//component/small_button.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//小按钮 用于购物车登录,结算按钮
class KSmallButton extends StatelessWidget {
  //按钮文本
  String text;
  //按下回调函数
  Function onPressed;
  //构造函数
  KSmallButton({String text,Function onPressed}){
    this.text = text;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    //容器 界定按钮大小
    return Container(
      width: ScreenUtil().setWidth(160),
      height: 42,
      //按钮
      child: InkWell(
        //点击回调
        onTap: () {
          this.onPressed();
        },
        //容器
        child: Container(
          //内边距
          padding: EdgeInsets.all(10.0),
          //居中对齐
          alignment: Alignment.center,
          //边框样式
          decoration: BoxDecoration(
            color: KColor.BUY_BUTTON_COLOR,
            borderRadius: BorderRadius.circular(3.0),
          ),
          //按钮文本
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
