//page/category/category_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/category/category_second.dart';
import 'package:flutter_shop/page/category/category_first.dart';
//分类页面
class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //商品分类
        title: Text(KString.CATEGORY_TITLE),
      ),
      //容器
      body: Container(
        //水平布局
        child: Row(
          children: <Widget>[
            //一级分类
            CategoryFirst(),
            Expanded(
              //二级分类
              child: CategorySecond(),
            ),
          ],
        ),
      ),
    );
  }
}
