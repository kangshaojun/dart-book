//widgets/icon_text_arrow_widget.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//带有文本的箭头图标组件
class IconTextArrowWidget extends StatelessWidget {
  //图标数据
  final IconData iconData;
  //标题
  final title;
  //点击回调方法
  final VoidCallback callback;
  //图标颜色
  final Color color;

  //构造方法
  IconTextArrowWidget(
    this.iconData,
    this.title,
    this.color,
    this.callback,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil.getInstance().setHeight(100.0),
        width: double.infinity,
        //点击整个组件回调此方法
        child: InkWell(
          onTap:callback,
          //水平布局
          child: Row(
            //次轴居中
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0),
                //左侧图标
                child: Icon(
                  iconData,
                  size: ScreenUtil.getInstance().setWidth(40.0),
                  color: color,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(20.0)),
              ),
              //标题
              Text(
                title,
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(26.0),
                    color: Colors.black54),
              ),
              //右侧箭头
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                      right: ScreenUtil.getInstance().setWidth(30.0)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: ScreenUtil.getInstance().setWidth(30),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
