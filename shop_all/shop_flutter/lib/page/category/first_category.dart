//page/category/first_category.dart文件
import 'package:flutter/material.dart';
import 'package:shop/model/first_category_model.dart';
import 'package:shop/event/category_event.dart';
import 'package:shop/service/category_service.dart';
import 'package:shop/config/index.dart';

//一级分类组件
class FirstCategoryWidget extends StatefulWidget {
  @override
  _FirstCategoryWidgetState createState() => _FirstCategoryWidgetState();
}

class _FirstCategoryWidgetState extends State<FirstCategoryWidget> {
  //分类数据服务
  CategoryService categoryService = CategoryService();
  //一级分类数据列表
  List<FirstCategoryModel> firstCategoryList = List();
  //当前分类选择索引
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    //获取一级分类数据
    categoryService.getFirstCategoryData((list) {
      //派发事件,二级分类监听此事件
      eventBus.fire(CategoryEvent(list[0].id, list[0].name, list[0].picUrl));
      setState(() {
        //设置一级分类列表数据
        firstCategoryList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        //一级分类列表
        child: ListView.builder(
            //一级分类长度
            itemCount: firstCategoryList.length,
            //一级分类项构造器
            itemBuilder: (BuildContext context, int index) {
              return _getFirstLevelItemWidget(firstCategoryList[index], index);
            }));
  }

  //点击一类分类项
  _itemClick(int index) {
    setState(() {
      _selectIndex = index;
    });
    //触发事件,二级分类监听此事件用于获取二级分类数据
    eventBus.fire(CategoryEvent(
        firstCategoryList[index].id,
        firstCategoryList[index].name,
        firstCategoryList[index].picUrl));
  }

  //返回一级分类项组件
  Widget _getFirstLevelItemWidget(FirstCategoryModel firstLevelCategory, int index) {
    return GestureDetector(
      //点击一级分类项
      onTap: () => _itemClick(index),
      child: Container(
          width: 100.0,
          height: 50.0,
          alignment: Alignment.center,
          //垂直布局
          child: Column(
            children: <Widget>[
              Container(
                height: 48,
                alignment: Alignment.center,
                //分类名称
                child: Text(firstLevelCategory.name,
                    //判断索引是否为当前选择的索引
                    style: index == _selectIndex
                        ? TextStyle(
                            fontSize: 14.0, color: KColor.categorySelectedColor)
                        : TextStyle(fontSize: 14.0, color: KColor.categoryDefaultColor)),
              ),
              //分类分割线
              index == _selectIndex
                  ? Divider(
                      height: 2.0,
                      color: KColor.categorySelectedColor,
                    )
                  : Divider(
                      color: Colors.white,
                      height: 1.0,
                    )
            ],
          )),
    );
  }
}
