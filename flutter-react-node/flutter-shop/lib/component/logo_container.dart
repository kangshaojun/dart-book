//component/logo_container.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
//登录或注册顶部Logo组件
class LogoContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //组件高度固定
    double height = 200.0;
    //组件宽高和父容器一样高
    double width = MediaQuery.of(context).size.width;
    //容器
    return Container(
      width: width,
      height: height,
      //背景色
      color: KColor.PRIMARY_COLOR,
      //层叠组件
      child: Stack(
        //超出部分显示
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            //左边
            left: (width - 90) / 2.0,
            //顶部
            top: height - 45,
            //Logo容器
            child: Container(
              width: 90.0,
              height: 90.0,
              //边框
              decoration: BoxDecoration(
                ///阴影
                boxShadow: [
                  BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
                ],
                ///形状
                shape: BoxShape.circle,
                ///图片
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/head.jpeg'),
              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
