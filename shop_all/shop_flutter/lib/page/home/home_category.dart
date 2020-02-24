//page/home/home_category.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/model/home_model.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/widgets/cached_image_widget.dart';
//首页分类组件
class HomeCategoryWidget extends StatelessWidget {
  //首页分类列表数据
  List<Channel> categoryList;
  //传入分类列表
  HomeCategoryWidget(this.categoryList);
  //跳转到指定分类的商品列表页面
  _goCategoryView(BuildContext context, Channel channel) {
    //传入分类名称及分类Id
    NavigatorUtil.goCategoryGoodsListPage(context, channel.name, channel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //网格布局,2行5列
      child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      //分类项个数
      itemCount: categoryList.length,
      //项构建器
      itemBuilder: (BuildContext context, int index) {
        //返回单元格项
        return _getGridViewItem(context, categoryList[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //单个子Widget的水平最大宽度
        crossAxisCount: 5,
        //水平单个子Widget之间间距
        mainAxisSpacing: ScreenUtil.instance.setWidth(20.0),
        //垂直单个子Widget之间间距
        crossAxisSpacing: ScreenUtil.instance.setWidth(20.0),
      ),
    ));
  }

  //网格单元格,展示一个分类信息
  Widget _getGridViewItem(BuildContext context, Channel channel) {
    return Center(
      //点击跳转到分类商品页面
      child: InkWell(
        onTap: () => _goCategoryView(context, channel),
        child: Column(
          children: <Widget>[
            //分类图标
            CachedImageWidget(
                ScreenUtil.instance.setWidth(60.0),
                ScreenUtil.instance.setWidth(60.0),
                channel.iconUrl
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.instance.setWidth(10.0)),
            ),
            //分类名称
            Text(
              channel.name,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
