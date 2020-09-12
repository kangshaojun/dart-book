//component/big_button.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
//大按钮 如登录 注册
class KBigButton extends StatelessWidget {
  //按钮文本
  String text;
  //按钮点击回调函数
  Function onPressed;
  //构造函数
  KBigButton({String text,Function onPressed}){
    this.text = text;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      //外边距
      margin: EdgeInsets.only(left: 10,right: 10),
      //内边距
      padding: EdgeInsets.all(0),
      //宽度
      width: MediaQuery.of(context).size.width-20,
      //高度
      height: 48,
      //按钮
      child: RaisedButton(
        //按下回调
        onPressed: (){
          this.onPressed();
        },
        //按钮文本
        child: Text(this.text),
        //背景色
        color: KColor.PRIMARY_COLOR,
        //文本颜色
        textColor: Colors.white,
        //设置圆形外边框
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
