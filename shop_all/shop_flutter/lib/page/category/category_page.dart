//page/category/category_page.dart文件
import 'package:flutter/material.dart';
import 'package:shop/page/category/first_category.dart';
import 'package:shop/page/category/sub_category.dart';
import 'package:shop/config/string.dart';
//分类页面
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //分类标题
          title: Text(KString.CATEGORY_TITLE),
          centerTitle: true,
        ),
        body: Container(
          //水平布局
          child: Row(
              children: <Widget>[
                //左侧为一级分类
                Expanded(
                  flex: 2,
                  child: FirstCategoryWidget(),
                ),
                //右侧为二级分类
                Expanded(
                  flex: 8,
                  child: SubCategoryWidget(),
                ),
                ],
          ),
        ),
    );
  }
}
