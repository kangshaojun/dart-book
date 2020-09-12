//page/category/category_second.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/utils/router_util.dart';
//二级分类
class CategorySecond extends StatefulWidget {
  _CategorySecondState createState() => _CategorySecondState();
}

class _CategorySecondState extends State<CategorySecond> {
  //二级分类列表数据
  List<CategoryModel> _secondList = [];
  //一级分类Id
  int _firstCategoryId = 0;
  //二级分类Id
  int _secondCategoryId = 0;

  @override
  void initState() {
    super.initState();
    //监听消息 刷新二级分类数据
    Call.addCallBack(Notify.REFRESH_SECOND_CATEGORY, this._refreshCategory);
  }

  //刷新二级分类数据
  _refreshCategory(data){
    //设置一级分类Id
    this.setState(() {
      _firstCategoryId = data['firstCategoryId'];
    });
    //根据一级分类Id获取二级分类数据
    this._getSecondCategory(data['firstCategoryId']);
  }

  //获取二级分类数据
  _getSecondCategory(int id) async{
    //调用二级分类接口 传入父Id即一级分类Id
    var response = await HttpService.get(ApiUrl.CATEGORY_SECOND,param: {'pid':id});
    //将Json数据转换成分类列表数据模型
    CategoryListModel model = CategoryListModel.fromJson(response['data']);

    //判断是否有分类
    if(model.list.length > 0){
      //默认取第一个分类Id
      var secondId = model.list[0].id;
      //设置状态
      this.setState(() {
        _secondList = model.list;
        _secondCategoryId = secondId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //容器
    return Container(
      padding: EdgeInsets.only(left: 10),
      //垂直布局
      child: Column(
        children: <Widget>[
          //顶部间距
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          //网络视图
          GridView.builder(
            //不滚动
            physics: NeverScrollableScrollPhysics(),
            //网格个数
            itemCount: _secondList.length,
            shrinkWrap: true,
            //网络代理
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //列数
              crossAxisCount: 3,
              //主轴方向间距
              mainAxisSpacing: 20.0,
              //次轴方向间距
              crossAxisSpacing: 20.0,
            ),
            //网格构建器
            itemBuilder: (BuildContext context, int index){
              //返回分类项
              return _categoryItem(_secondList[index]);
            },
          ),
          //间距
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );;
  }

  //分类项
  Widget _categoryItem(CategoryModel categoryModel) {
    //点击
    return GestureDetector(
      onTap: (){
        //设置二级分类Id
        this.setState(() {
          _secondCategoryId = categoryModel.id;
        });
        //跳转至商品列表页 传入一级和二级分类Id
        RouterUtil.toCategoryGoodListPage(context,_firstCategoryId,_secondCategoryId);
      },
      //容器
      child: Container(
        //居中
        alignment: Alignment.center,
        //垂直布局
        child: Column(children: <Widget>[
          //分类图片
          Image.network(
            categoryModel.image,
            fit: BoxFit.cover,
            height: 60,
          ),
          //分类名称
          Text(
            categoryModel.name,
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
        ]),
      ),
    );
  }

}