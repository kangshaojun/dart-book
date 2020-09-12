//component/item_text_field.dart文件
import 'package:flutter/material.dart';
//文本输入框 用户登录注册页面输入使用
class ItemTextField extends StatelessWidget {
  //图标
  Icon icon;
  //文本编辑控制器
  TextEditingController controller;
  //焦点
  FocusNode focusNode;
  //标题
  String title;
  //提示文本
  String hintText;
  //是否为密码框
  bool obscureText;
  //构造函数
  ItemTextField({this.icon,this.controller,this.focusNode,this.title,this.hintText,this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      height: 40,
      //设置圆角边框
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      //层叠组件
      child: Stack(
        children: <Widget>[
          //左侧图标
          Positioned(
            left: 16,
            top: 8,
            width: 18,
            height: 18,
            child: icon,
          ),
          //输入文本
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            //文本框
            child: TextField(
              //文本控制器
              controller: controller,
              //焦点控制
              focusNode: focusNode,
              //输入框装饰器
              decoration: InputDecoration(
                //提示文本
                hintText: hintText,
                border: InputBorder.none,
              ),
              //字体大小
              style: TextStyle(fontSize: 14),
              //是否为密码框
              obscureText: obscureText,
            ),
          )
        ],
      ),
    );
  }
}
