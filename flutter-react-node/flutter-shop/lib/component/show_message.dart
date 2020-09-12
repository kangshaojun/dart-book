//component/show_message.dart文件
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//弹出消息组件
class MessageWidget{

  //显示消息
  static show(String msg){
    Fluttertoast.showToast(
        //消息内容
        msg: msg,
        //居中
        gravity: ToastGravity.CENTER,
        //时间
        timeInSecForIos: 2,
        //文本颜色
        textColor: Colors.white,
        //字体大小
        fontSize: 14.0
    );
  }

}