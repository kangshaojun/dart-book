//page/category/category_good_list_page.dart文件
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/model/category_good_model.dart';
import 'package:flutter_shop/component/show_message.dart';
//分类商品列表页
class CategoryGoodListPage extends StatefulWidget {
  //一级分类Id
  int _firstCategoryId = 0;
  //二级分类Id
  int _secondCategoryId = 0;
  //构造函数
  CategoryGoodListPage(this._firstCategoryId,this._secondCategoryId);

  _CategoryGoodListPageState createState() => _CategoryGoodListPageState();
}

class _CategoryGoodListPageState extends State<CategoryGoodListPage> {

  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  //滚动控制
  var scrollController = ScrollController();
  //商品列表数据
  List<CategoryGoodModel> _goodList = [];

  //当前页
  int _pageIndex = 1;
  //每页条数
  int _pageSize = 4;

  //是否还有数据
  bool _noMoreData = true;

  @override
  void initState() {
    super.initState();
    //获取商品列表数据
    this._getGoodList();
  }

  //获取商品列表数据
  _getGoodList() async {
    //参数
    var param = {
      //一级分类Id
      'category_first':widget._firstCategoryId,
      //二级分类Id
      'category_second':widget._secondCategoryId,
      //当前页
      'page_index':_pageIndex,
      //每页条数
      'page_size':_pageSize,
    };
    //调用分类商品列表接口
    var response = await HttpService.get(ApiUrl.CATEGORY_GOOD_LIST,param: param);
    //将Json数据转换成分类商品列表数据模型
    CategoryGoodListModel model = CategoryGoodListModel.fromJson(response['data']);
    //设置状态
    this.setState(() {
      _goodList = model.list;
      _noMoreData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //商品列表
      appBar: AppBar(
        title: Text(KString.GOOD_LIST_TITLE),
      ),
      //判断是否有数据
      body: _goodList.length > 0 ?
      Container(
        width: 400,
        //刷新组件
        child: EasyRefresh(
          //底部刷新
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            //背景色
            bgColor: Colors.white,
            //提示文本颜色
            textColor: KColor.REFRESH_TEXT_COLOR,
            //更多信息颜色
            moreInfoColor: KColor.REFRESH_TEXT_COLOR,
            //更多信息文本
            moreInfo: KString.LOADING,
            //是否显示更多
            showMore: true,
            //没有更多数据提示文本
            noMoreText: _noMoreData ? KString.NO_MORE_DATA : "",
            //上拉加载
            loadReadyText: KString.LOAD_READY_TEXT,
          ),
          //列表视图
          child: ListView.builder(
            //滚动控制器
            controller: scrollController,
            //列表项个数
            itemCount: _goodList.length,
            //列表项构建器
            itemBuilder: (context, index) {
              //列表项
              return _gooListItem(_goodList, index);
            },
          ),
          //加载更多处理
          loadMore: () async {
            //没有更多了
            if (_noMoreData) {
              //提示信息
              MessageWidget.show(KString.TO_BOTTOM);
            } else {
              //获取更多数据
              _getMoreData();
            }
          },
        ),
      ) :Text(KString.NO_MORE_DATA) //暂时没有数据,
    );
  }

  //上拉加载更多的方法
  void _getMoreData() async {
    //当前页数
    _pageIndex++;
    //参数
    var param = {
      //一级分类Id
      'category_first':widget._firstCategoryId,
      //二级分类Id
      'category_second':widget._secondCategoryId,
      //当前页
      'page_index':_pageIndex,
      //每页条数
      'page_size':_pageSize,
    };
    //调用分类商品列表接口
    var response = await HttpService.get(ApiUrl.CATEGORY_GOOD_LIST,param: param);
    //将Json数据转换成分类商品列表数据模型
    CategoryGoodListModel model = CategoryGoodListModel.fromJson(response['data']);

    //判断是否有返回的商品数据
    if (model.list != null && model.list.length > 0) {
      //将数据添加至商品列表里
      _goodList.addAll(model.list);
      this.setState(() {
        _goodList = _goodList;
        _noMoreData = false;
      });
    } else {
      this.setState(() {
        _noMoreData = true;
      });
    }
  }

  //商品列表项
  Widget _gooListItem(List<CategoryGoodModel> list, int index) {
    return InkWell(
      onTap: () {
        //跳转至商品详情页
        RouterUtil.toGoodDetailPage(context, list[index].id.toString());
      },
      //容器
      child: Container(
        //间距
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        //装饰器
        decoration: BoxDecoration(
            color: Colors.white,
            //添加底部边框
            border: Border(
              bottom: BorderSide(width: 1.0, color: KColor.BORDER_COLOR),
            ),
        ),
        //水平布局
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            //商品图片
            _goodImage(list, index),
            SizedBox(
              width: 10,
            ),
            //垂直布局
            Column(
              children: <Widget>[
                //商品名称
                _goodName(list, index),
                //商品价格
                _goodPrice(list, index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //商品图片
  Widget _goodImage(List<CategoryGoodModel> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(160),
      //截取第一张图片
      child: Image.network(list[index].images.split(',')[0]),
    );
  }

  //商品名称
  Widget _goodName(List<CategoryGoodModel> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        //名称
        list[index].name,
        //最多显示两行
        maxLines: 2,
        //超出部分省略
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  //商品价格
  Widget _goodPrice(List<CategoryGoodModel> list, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          //商品折扣价
          Text(
            KString.GOOD_LIST_PRICE + '${list[index].discount_price}',
            style: TextStyle(color: KColor.PRICE_TEXT_COLOR),
          ),
          SizedBox(
            width: 10,
          ),
          //商品原价
          Text(
            '￥${list[index].price}',
            style: KFont.PRICE_STYLE,
          ),
        ],
      ),
    );
  }

}
