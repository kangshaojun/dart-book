//component/circle_check_box.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
//圆形复选框
class CircleCheckBox extends StatefulWidget {
  //选中状态值
  bool value = false;
  //选中改变回调函数
  Function onChanged;
  //构造函数
  CircleCheckBox({this.value, this.onChanged});

  @override
  _CircleCheckBoxState createState() => _CircleCheckBoxState();
}

class _CircleCheckBoxState extends State<CircleCheckBox> {
  @override
  Widget build(BuildContext context) {
    //居中
    return Center(
      //手势检测
      child: GestureDetector(
          //点击
          onTap: () {
            //设置value值
            widget.value = !widget.value;
            //回调处理
            widget.onChanged(widget.value);
          },
          //内边距
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //根据值设置图标
            child: widget.value
                ? Icon(
              Icons.check_circle,
              size: 28.0,
              color: KColor.CHECKBOX_COLOR,
            )
                : Icon(
              Icons.panorama_fish_eye,
              size: 28.0,
              color: Colors.grey,
            ),
          )),
    );
  }
}