//page/home/home_category.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/utils/router_util.dart';
//首页分类导航组件
class HomeCategory extends StatelessWidget {
  //首页分类列表数据
  List<HomeCategoryModel> _list;
  //构造函数
  HomeCategory(this._list);

  //分类项
  Widget _categoryItem(BuildContext context, HomeCategoryModel item) {
    //点击组件
    return InkWell(
      //点击跳转至分类页面
      onTap: () {
        this._goCategory(context,item.id);
      },
      //垂直布局
      child: Column(
        children: <Widget>[
          //分类图片
          Image.network(
            item.image,
            width: ScreenUtil().setWidth(95),
          ),
          //分类名称
          Text(item.name)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //截取10个分类
    if (_list.length > 10) {
      _list.removeRange(10, _list.length);
    }
    //容器
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0,),
      height: ScreenUtil().setHeight(240),
      padding: EdgeInsets.all(3.0),
      //网格组件
      child: GridView.builder(
        //禁止滚动
        physics: NeverScrollableScrollPhysics(),
        //分类个数
        itemCount: _list.length,
        padding: EdgeInsets.all(4.0),
        //网络配置
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //列数
          crossAxisCount: 5,
          //主轴间距
          mainAxisSpacing: ScreenUtil.instance.setWidth(10.0),
          //次轴间距
          crossAxisSpacing: ScreenUtil.instance.setWidth(10.0),
        ),
        //网络项构建器
        itemBuilder: (BuildContext context,int index){
          //返回分类项
          return _categoryItem(context, _list[index]);
        },
      ),
    );
  }

  //跳转到分类商品列表页面 一级分类Id 二级分类Id传入0
  void _goCategory(context, int categoryId) async {
    RouterUtil.toCategoryGoodListPage(context, categoryId, 0);
  }
}
