//page/category/category_first.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
//一级分类
class CategoryFirst extends StatefulWidget {
  _CategoryFirstState createState() => _CategoryFirstState();
}

class _CategoryFirstState extends State<CategoryFirst> {
  //一级分类列表数据
  List<CategoryModel> _firstList = [];

  //一级分类Id
  int _firstCategoryId = 0;

  @override
  void initState() {
    super.initState();
    //获取一级分类数据
    this._getFirstCategory();
  }

  //获取分类数据
  _getFirstCategory() async {
    //调用一级分类数据接口
    var response = await HttpService.get(ApiUrl.CATEGORY_FIRST);
    //将Json转换成分类列表数据模型
    CategoryListModel model = CategoryListModel.fromJson(response['data']);

    //获取第一个分类Id
    var id = model.list[0].id;

    this.setState(() {
      //设置一级分类列表数据
      _firstList = model.list;
      //设置当前选中的Id
      _firstCategoryId = id;
    });

    //派发消息 刷新二级分类数据
    Call.dispatch(Notify.REFRESH_SECOND_CATEGORY,
        data: {'firstCategoryId': id});
  }

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      width: ScreenUtil().setWidth(180),
      color: Colors.white,
      //列表视图
      child: ListView.builder(
          //分类个数
          itemCount: _firstList.length,
          //分类项构建器
          itemBuilder: (context, index) {
            //渲染分类项
            return _categoryItem(_firstList, index);
          }),
    );
  }

  //构建分类项
  Widget _categoryItem(List<CategoryModel> list, int index) {
    //判断当前分类项是否为选中的项
    bool _isSelected = (list[index].id == _firstCategoryId);
    //点击按钮
    return InkWell(
      onTap: () async {
        //获取当前选中项Id
        int id = list[index].id;
        //设置状态
        this.setState(() {
          _firstCategoryId = id;
        });
        //派发消息 刷新二级分类数据
        Call.dispatch(Notify.REFRESH_SECOND_CATEGORY, data: {'firstCategoryId': id});
      },
      child: Container(
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          border: Border(
            //底部边框
            bottom: BorderSide(
                width: 1,
                //判断当前项是否选中 使用颜色区分
                color: _isSelected ? KColor.PRIMARY_COLOR : Colors.white),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          //分类名称
          list[index].name,
          style: TextStyle(
            //判断当前项是否选中 使用颜色区分
            color: _isSelected ? KColor.PRIMARY_COLOR : Colors.black,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }
}
