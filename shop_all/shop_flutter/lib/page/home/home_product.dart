//home/home_product.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/model/home_model.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/widgets/cached_image_widget.dart';
import 'package:shop/config/index.dart';

//首页产品组件,用于显示最新产品及热卖产品
class HomeProductWidget extends StatelessWidget {
  //产品数据列表
  List<Goods> productList;
  //构造方法
  HomeProductWidget(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      //网络组件
      child: GridView.builder(
          shrinkWrap: true,
          //产品个数
          itemCount: productList.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //列的数量
            crossAxisCount: 2,
            //单元格宽高比系数
            childAspectRatio: 0.90
          ),
          //根据索引构建单元格
          itemBuilder: (BuildContext context, int index) {
            //返回单元格,传入商品数据
            return _getGridItemWidget(context, productList[index]);
          }),
    );
  }

  //跳转至产品详情页面
  _goGoodsDetail(BuildContext context, Goods goods) {
    NavigatorUtil.goGoodsDetails(context, goods.id);
  }

  //返回单元格,传入商品数据
  Widget _getGridItemWidget(BuildContext context, Goods productModel) {
    return Container(
      //点击跳转至商品详情页面
      child: InkWell(
        onTap: () => _goGoodsDetail(context, productModel),
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(6.0),
          //垂直布局
          child: Column(
            //垂直方向顶部对齐
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5.0),
                  //商品图片
                  child: CachedImageWidget(
                      ScreenUtil.instance.setHeight(200.0),
                      ScreenUtil.instance.setHeight(200.0),
                      //图片路径
                      productModel.picUrl
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              //商品名称
              Container(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  productModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              //商品零售价
              Container(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.center,
                child: Text(
                  "￥${productModel.retailPrice}",
                  style: TextStyle(color: KColor.priceColor, fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
