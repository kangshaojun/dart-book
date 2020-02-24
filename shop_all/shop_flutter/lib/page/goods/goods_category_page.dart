//page/goods/goods_category_page.dart
import 'package:flutter/material.dart';
import 'package:shop/page/goods/goods_list_page.dart';
import 'package:shop/service/goods_service.dart';
import 'package:shop/model/category_title_model.dart';
//商品分类页面
class GoodsCategoryPage extends StatefulWidget {
  //一级分类名称
  String categoryName;
  //一级分类Id
  int categoryId;

  //构造方法,传入一级分类名称和分类Id
  GoodsCategoryPage({Key key, @required this.categoryName, @required this.categoryId})
      : super(key: key);

  @override
  _GoodsCategoryPageState createState() => _GoodsCategoryPageState();
}

class _GoodsCategoryPageState extends State<GoodsCategoryPage> with TickerProviderStateMixin {
  ScrollController _scrollController;
  //二级分类选项卡
  TabController _tabController;
  //数据服务
  GoodsService _goodsService = GoodsService();
  //分类标题数据模型
  CategoryTitleModel _categoryTitleModel;
  //同级(二级)分类数据列表
  List<CategoryModel> brotherCategory = List();
  var categoryFuture;
  //当前选中的二级分类索引
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    //根据分类id获取二级分类标题
    categoryFuture = _goodsService.getGoodsCategory({"id": widget.categoryId}, (categoryTitles) {
      //分类标题
      _categoryTitleModel = categoryTitles;
      //同级分类标题
      brotherCategory = _categoryTitleModel.brotherCategory;
      //当前选项卡索引
      currentIndex = getCurrentIndex();
    }, (error) {});
  }

  //获取当前分类选项卡索引
  getCurrentIndex() {
    //循环同级分类
    for (int i = 0; i < brotherCategory.length; i++) {
      //判断如果分类id相等,表示查找到当前分类索引
      if (brotherCategory[i].id == _categoryTitleModel.currentCategory.id) {
        return i;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //异步构建组件
      child: FutureBuilder(
          future: categoryFuture,
          //构建器
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            //滚动控制
            _scrollController = ScrollController();
            //选项卡控制器
            _tabController = TabController(
              //初始化索引
              initialIndex: currentIndex,
              //选项个数
              length: brotherCategory.length,
              vsync: this
            );
            return Scaffold(
              appBar: AppBar(
                //一级分类名称
                title: Text(widget.categoryName),
                centerTitle: true,
                //选项卡,用于放二级分类名称
                bottom: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    //指示器颜色
                    indicatorColor: Colors.white,
                    //指定选项卡集
                    tabs: getTabBars()),
              ),
              //二级分类选项卡对应的视图
              body: TabBarView(
                children: getTabBarViews(),
                controller: _tabController,
              ),
            );
          }),
    );
  }

  //获取TabBar
  List<Widget> getTabBars() {
    List<Widget> tabBar = List();
    for (var category in brotherCategory) {
      tabBar.add(getTabBarWidget(category));
    }
    return tabBar;
  }

  //获取TabBarView
  List<Widget> getTabBarViews() {
    List<Widget> tabBarView = List();
    for (var i = 0; i < brotherCategory.length; i++) {
      //添加分类商品列表组件
      tabBarView.add(GoodsListPage(brotherCategory[i].id));
    }
    return tabBarView;
  }

  //获取Tab
  Widget getTabBarWidget(CategoryModel category) {
    return Tab(
      //分类名称
      text: category.name,
    );
  }
}
