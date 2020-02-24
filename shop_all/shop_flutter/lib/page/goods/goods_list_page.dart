//page/goods/goods_list_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/service/goods_service.dart';
import 'package:shop/model/goods_model.dart';
import 'package:shop/config/index.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/widgets/cached_image_widget.dart';
//商品列表组件
class GoodsListPage extends StatefulWidget {
  //二级分类Id
  int categoryId;
  //构造方法,传入二级分类Id
  GoodsListPage(this.categoryId);

  @override
  _GoodsListPageState createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  //商品数据服务
  GoodsService goodsService = GoodsService();
  //商品数据模型
  List<GoodsModel> goodsModels = List();
  //二级分类Id,用于查询二级分类的商品列表数据
  var categoryId;

  //根据二级分Id获取商品数据
  _getGoodsData(int categoryId) {
    goodsService.getGoodsList({"categoryId": categoryId, "page": 1, "limit": 100}, (goodsModelList) {
      //判断当前页面是否存在
      if(mounted){
        setState(() {
          goodsModels = goodsModelList;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (goodsModels == null || goodsModels.length == 0) {
      categoryId = widget.categoryId;
      //获取商品列表数据
      _getGoodsData(categoryId);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: goodsModels != null && goodsModels.length != 0
              ? GridView.builder(
                  itemCount: goodsModels == null ? 0 : goodsModels.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //两列
                    crossAxisCount: 2,
                    //间距
                    mainAxisSpacing: 6.0,
                    //间距
                    crossAxisSpacing: 6.0,
                    childAspectRatio: 1.0
                  ),
                  //构建商品列表项
                  itemBuilder: (BuildContext context, int index) {
                    //返回商品项
                    return getGoodsItemWidget(goodsModels[index]);
                  })
              : Center(
                  //垂直布局
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //没有数据图片提示
                      Image.asset(
                        "images/no_data.png",
                        height: 80,
                        width: 80,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      //没有数据文本提示
                      Text(
                        KString.NO_DATA_TEXT,
                        style: TextStyle(
                            fontSize: 16.0, color: KColor.noDataTextColor),
                      )
                    ],
                  ),
                ),
        ),
    ));
  }

  //获取商品项组件
  Widget getGoodsItemWidget(GoodsModel goodsModel) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: 320,
            height: 460,
            //卡片显示
            child: Card(
              //垂直布局
              child: Column(
                children: <Widget>[
                  //商品图片
                  CachedImageWidget(
                    double.infinity,
                    ScreenUtil.getInstance().setHeight(200.0),
                    goodsModel.picUrl,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  //商品名称
                  Text(
                    goodsModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  //商品价格
                  Text(
                    "¥${goodsModel.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: KColor.priceColor),
                  ),
                ],
              ),
            )),
      ),
      //点击处理
      onTap: () => _itemClick(goodsModel.id),
    );
  }

  //点击跳转至商品详情页面
  _itemClick(int id) {
    NavigatorUtil.goGoodsDetails(context, id);
  }
}
