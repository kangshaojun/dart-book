//page/category/sub_category.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/model/sub_category_model.dart';
import 'package:shop/event/category_event.dart';
import 'package:shop/service/category_service.dart';
import 'package:shop/utils/navigator_util.dart';

//二级分类组件
class SubCategoryWidget extends StatefulWidget {
  @override
  _SubCategoryWidgetState createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  //分类数据服务
  CategoryService categoryService = CategoryService();
  //二级分类数据列表
  List<SubCategoryModel> subCategoryModels = List();

  //一级分类名称,图片及分类Id
  var categoryName, categoryImage, categoryId;
  bool flag = true;

  @override
  void initState() {
    super.initState();
  }

  //监听事件,更新视图
  _listener() {
    eventBus.on<CategoryEvent>().listen((CategoryEvent event) => _updateView(event));
  }

  //更新二级分类视图
  _updateView(CategoryEvent categoryEvent) {
    if (flag) {
      flag = false;
      print("_updateView");
      setState(() {
        //一级分类名称
        categoryName = categoryEvent.categoryName;
        //一级分类图片
        categoryImage = categoryEvent.categoryImage;
        //一级分类id
        categoryId = categoryEvent.id;
      });
      //根据一级分类id获取二级分类数据
      _getSubCategory(categoryEvent.id);
    }
  }

  //根据id获取二级分类数据
  _getSubCategory(int id) {
    var params = {"id": id};
    print(params);
    print("_getSubCategory");
    //获取二级分类数据
    categoryService.getSubCategoryData(params, (subCategoryModelList) {
      flag = true;
      setState(() {
        //设置二级分类数据
        subCategoryModels = subCategoryModelList;
      });
    }, onFail: (value) {});
  }

  @override
  Widget build(BuildContext context) {
    //监听事件
    _listener();

    return Container(
      //垂直布局
      child: Column(
        children: <Widget>[
          //一级分类图片容器
          Container(
            padding: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
            height: ScreenUtil.instance.setHeight(200.0),
            //一级分类图片
            child: categoryImage != null ? Image.network(
              categoryImage,
              fit: BoxFit.fill,
            ) : Container(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
          ),
          Center(
            //一级分类名称
            child: Text(
              categoryName ?? "",
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ),
          //网格布局
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              //二级分类数量
              itemCount: subCategoryModels.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //3列
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.85,
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: 20.0),
              //分类项构造器
              itemBuilder: (BuildContext context, int index) {
                return getItemWidget(subCategoryModels[index]);
              }),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );
  }

  //点击二级分类项,导航至分类商品列表页面
  _itemClick(int id) {
    NavigatorUtil.goCategoryGoodsListPage(context,categoryName,id);
  }

  //二级分类项组件
  Widget getItemWidget(SubCategoryModel categoryName) {
    return GestureDetector(
      child: Container(
          alignment: Alignment.center,
          child: Card(
            //垂直布局,上面分类图标下面分类名称
            child: Column(
              children: <Widget>[
                //二级分类图标
                Image.network(
                  categoryName.picUrl ?? "",
                  fit: BoxFit.fill,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                //二级分类名称
                Text(
                  categoryName.name,
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
              ],
            ),
          )),
      //点击处理
      onTap: () => _itemClick(categoryName.id),
    );
  }
}
