//page/mine/mine_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/item_text_widget.dart';
import 'package:shop/widgets/divider_line_widget.dart';
//关于我们页面
class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //标题
        title: Text(KString.MINE_ABOUT_US),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        //垂直布局
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //公司名称
            Text(
              KString.MINE_ABOUT_US_CONTENT,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            Padding(padding: EdgeInsets.all(ScreenUtil.instance.setHeight(10.0))),
            DividerLineWidget(),
            //名字
            ItemTextWidget(KString.MINE_ABOUT_NAME_TITLE, KString.MINE_ABOUT_NAME),
            DividerLineWidget(),
            //邮箱
            ItemTextWidget(KString.MINE_ABOUT_EMAIL_TITLE, KString.MINE_ABOUT_EMAIL),
            DividerLineWidget(),
            //联系方式
            ItemTextWidget(KString.MINE_ABOUT_TEL_TITLE, KString.MINE_ABOUT_TEL),
            DividerLineWidget(),
          ],
        ),
      ),
    );
  }
}
