//page/goods/goods_detail_page.dart文件
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/service/goods_service.dart';
import 'package:shop/service/cart_service.dart';
import 'package:shop/model/goods_detail_model.dart';
import 'package:shop/config/index.dart';
import 'package:shop/page/goods/goods_detail_gallery.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/utils/toast_util.dart';
import 'package:shop/widgets/cart_number_widget.dart';
import 'package:shop/event/refresh_event.dart';
import 'package:shop/service/collect_service.dart';
import 'package:shop/widgets/cached_image_widget.dart';
//商品详情页面
class GoodsDetailPage extends StatefulWidget {
  //商品Id
  int goodsId;
  //构造方法,商品Id为必传参数
  GoodsDetailPage({Key key, @required this.goodsId}) : super(key: key);

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  //商品Id
  int goodsId;
  //商品数据服务
  GoodsService _goodsService = GoodsService();
  //购物车数据服务
  CartService _cartService = CartService();
  //商品收藏数据服务
  CollectService _collectService = CollectService();
  //商品详情数据模型
  GoodsDetailModel _goodsDetail;
  //参数对象
  var parameters;
  //规格索引
  int _specificationIndex = 0;
  //商品数量
  int _number = 1;
  //请求商品详情接口返回的Future对象
  var _goodsDetailFuture;
  //Token
  var token;
  //是否收藏
  var _isCollection = false;

  @override
  void initState() {
    super.initState();
    //通过widget获取商品Id
    goodsId = widget.goodsId;
    //组装参数
    var params = {"id": goodsId};
    //获取商品详情数据
    _goodsDetailFuture = _goodsService.getGoodsDetailData(params, (goodsDetail) {
      _goodsDetail = goodsDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          //页面标题
          title: Text(KString.GOODS_DETAIL),
          centerTitle: true,
        ),
        //异步构建组件
        body: FutureBuilder(
          //future对象
          future: _goodsDetailFuture,
          //构建器
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            //连接状态
            switch (asyncSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                //等待加载数据
                return Container(
                  child: Center(
                    //显示等待组件
                    child: SpinKitFoldingCube(
                      size: 40.0,
                      color: KColor.watingColor,
                    ),
                  ),
                );
              default:
                //服务器出错提示
                if (asyncSnapshot.hasError)
                  return Container(
                    child: Center(
                      child: Text(
                        KString.SERVER_EXCEPTION,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                else
                  //商品详情组件
                  return _detailWidget();
            }
          },
        ),
        //页面底部组件
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              children: <Widget>[
                //是否收藏组件
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => _collection(),
                        child: Icon(
                          Icons.star_border,
                          color: _isCollection
                              ? KColor.collectionButtonColor
                              : KColor.unCollectionButtonColor,
                          size: 30.0,
                        ),
                      ),
                    )),
                //购物车图标
                Expanded(
                    flex: 1,
                    child:Icon(
                      Icons.add_shopping_cart,
                      color: KColor.addCartIconColor,
                      size: 30.0,
                    ),
                ),
                //添加至购物车按钮
                Expanded(
                    flex: 2,
                    child: Container(
                      color: KColor.addCartButtonColor,
                      child: InkWell(
                        //打开底部弹出框
                        onTap: () => openBottomSheet(
                            context, _goodsDetail.productList[0], 1),
                        child: Center(
                          child: Text(
                            KString.ADD_CART,
                            style: TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                        )),
                    )),
                //立即购买按钮
                Expanded(
                  flex: 2,
                  child: Container(
                      color: KColor.buyButtonColor,
                      child: InkWell(
                        //打开底部弹出框
                        onTap: () => openBottomSheet(
                            context, _goodsDetail.productList[0], 2),
                        child: Center(
                          child: Text(
                            KString.BUY,
                            style: TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                        ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //打开底部弹出框,showType为1表示添加至购物车,2表示立即购买
  openBottomSheet(BuildContext context, ProductModel productList, int showType) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          //安全区域
          return SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: ScreenUtil.instance.setHeight(630.0),
              child: Container(
                //垂直布局
                child: Column(
                  //次轴即水平方向靠左对齐
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
                      //水平布局
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //商品图片
                          CachedImageWidget(
                              ScreenUtil.instance.setWidth(120.0),
                              ScreenUtil.instance.setWidth(120.0),
                              productList.url),
                          //垂直布局,价格及选择规格
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //价格
                              Text(
                                KString.PRICE + "：" + "${productList.price}",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ScreenUtil.instance.setSp(24.0)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil.instance.setHeight(10.0)),
                              ),
                              //选择规格
                              Text(KString.ALREAD_SELECTED +
                                  "：" + _goodsDetail.productList[0].specifications[_specificationIndex])
                            ],
                          ),
                          Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                //删除按钮
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  //点击返回
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
                      //商品规格提示
                      child: Text(
                        KString.SPECIFICATIONS,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(30.0)),
                      ),
                    ),
                    //商品规格
                    Wrap(
                        children: _specificationsWidget(productList.specifications)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil.instance.setHeight(10.0)),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
                      //商品数量
                      child: Text(
                        KString.NUMBER,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(30.0)),
                      ),
                    ),
                    Container(
                        margin:
                        EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
                        height: ScreenUtil.instance.setHeight(80),
                        alignment: Alignment.centerLeft,
                        //商品数量加减组件
                        child: CartNumberWidget(1, (number) {
                          setState(() {
                            //设置当前商品数据
                            _number = number;
                          });
                        })),
                    Expanded(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil.instance.setHeight(100.0),
                              width: double.infinity,
                              child: InkWell(
                                //点击添加至购物车或立即购买
                                onTap: () => showType == 1 ? _addCart() : _buy(),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: KColor.defaultButtonColor,
                                  //添加至购物车或立即购买文本
                                  child: Text(
                                    showType == 1 ? KString.ADD_CART : KString.BUY,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(30.0)),
                                  ),
                                )),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  //商品规格
  List<Widget> _specificationsWidget(List<String> specifications) {
    List<Widget> specificationsWidget = List();
    //循环迭代出所有规格
    for (int i = 0; i < specifications.length; i++) {
      specificationsWidget.add(Container(
          padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10.0)),
          child: InkWell(
            child: Chip(
              //规格名称
              label: Text(
                specifications[i],
                //选中与未选中使用不同颜色区分
                style: TextStyle(
                    color: i == _specificationIndex
                        ? Colors.white
                        : Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(24.0)),
              ),
              //选中与未选中使用不同颜色区分
              backgroundColor: i == _specificationIndex
                  ? KColor.specificationWarpColor
                  : Colors.grey,
            ),
          )));
    }
    return specificationsWidget;
  }

  //添加至购物车
  _addCart() {
    //获取token值
    SharedPreferencesUtil.getToken().then((value) {
      if (value != null) {
        //参数
        parameters = {
          //商品Id
          "goodsId": _goodsDetail.info.id,
          //规格Id
          "productId": _goodsDetail.productList[0].id,
          //数量
          "number": _number
        };
        //调用购物车数据服务的addCart方法
        _cartService.addCart(parameters, (value) {
          ToastUtil.showToast(KString.ADD_CART_SUCCESS);
          //隐藏弹出框
          Navigator.of(context).pop();
          //通知刷新
          eventBus.fire(RefreshEvent());
        }, );
      } else {
        //如果没有token值跳转至登录框
        NavigatorUtil.goLogin(context);
      }
    });
  }

  //立即购买
  _buy() {
    if (SharedPreferencesUtil.token != null) {
      //提交参数
      parameters = {
        //商品Id
        "goodsId": _goodsDetail.info.id,
        //商品规格Id
        "productId": _goodsDetail.productList[0].id,
        //商品数量
        "number": _number,
      };
      //调用商品购买方法
      _cartService.fastBuy(parameters, (success) {
        //进入商品结算页面
        NavigatorUtil.goFillInOrder(context, success);
      }, (error) {});
    } else {
      //未登录跳转至登录页面
      NavigatorUtil.goLogin(context);
    }
  }

  //收藏商品
  _collection() {
    SharedPreferencesUtil.getToken().then((value) {
      if (value == null) {
        //未登录跳转至登录页面
        NavigatorUtil.goLogin(context);
      } else {
        token = value;
        //收藏和取消收藏商品
        _addOrDeleteCollect();
      }
    });
  }

  //收藏和取消收藏商品
  _addOrDeleteCollect() {
    Options options = Options();
    //添加token至header
    options.headers["X-Shop-Token"] = token;
    //参数
    var parameters = {"type": 0, "valueId": _goodsDetail.info.id};
    _collectService.addOrDeleteCollect(parameters, (onSuccess) {
      setState(() {
        _isCollection = true;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  //详情组件
  Widget _detailWidget() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        ListView(
          children: <Widget>[
            //商品轮播图
            GoodsDetailGalleryWidget(_goodsDetail.info.gallery, _goodsDetail.info.gallery.length, 240.0),
            Divider(
              height: 2.0,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //商品名称
                  Text(
                    _goodsDetail.info.name,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                  ),
                  //商品简介
                  Text(
                    _goodsDetail.info.brief,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                  ),
                  Row(
                    children: <Widget>[
                      //商品原价
                      Text(
                        "原价：${_goodsDetail.info.counterPrice}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      //商品现价
                      Text(
                        "现价：${_goodsDetail.info.retailPrice}",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent, fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
            ),
            //商品属性
            _goodsDetail.attribute == null || _goodsDetail.attribute.length == 0
                ? Divider()
                : Container(
                    //垂直布局
                    child: Column(
                      children: <Widget>[
                        //商品属于标题
                        Text(
                          KString.GOODS_ATTRIBUTES,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                        ),
                        //商品属性组件
                        _attributeWidget(_goodsDetail),
                      ],
                    ),
                  ),
            //商品详细信息
            Html(data: _goodsDetail.info.detail),
            //常见问题
            _goodsDetail.issue == null || _goodsDetail.issue.length == 0
                ? Divider()
                : Container(
                    //垂直布局
                    child: Column(
                      children: <Widget>[
                        //常见问题标题
                        Text(
                          KString.COMMON_PROBLEM,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                        ),
                        //常见问题组件
                        _issueWidget(_goodsDetail),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  //商品属性Widget
  Widget _attributeWidget(GoodsDetailModel goodsDetail) {
    print("${goodsDetail.attribute.length}");
    //商品属性通过列表一行一行的展示
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        //商品属性个数
        itemCount: goodsDetail.attribute.length,
        //商品属性项构建器
        itemBuilder: (BuildContext context, int index) {
          return _attributeItemWidget(goodsDetail.attribute[index]);
        });
  }

  //商品属性项
  Widget _attributeItemWidget(AttributeModel attribute) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(6.0),
        //水平布局
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              //商品属性名称
              child: Text(
                attribute.attribute,
                style: TextStyle(color: KColor.attributeTextColor, fontSize: 14.0),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  //商品属性值
                  child: Text(
                    attribute.value,
                    style: TextStyle(color: KColor.attributeTextColor, fontSize: 14.0),
                  ),
                )),
          ],
        ));
  }

  //常见问题
  Widget _issueWidget(GoodsDetailModel goodsDetail) {
    //常用问题使用列表一行一行的展示
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        //常见问题条数
        itemCount: goodsDetail.issue.length,
        //常见问题项构建器
        itemBuilder: (BuildContext context, int index) {
          return _issueItemWidget(goodsDetail.issue[index]);
        });
  }

  //常见问题列表项
  Widget _issueItemWidget(IssueModel issue) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
        padding: EdgeInsets.all(6.0),
        //垂直布局,一问一答为一组
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //常见问题:问
            Text(
              issue.question,
              style: TextStyle(color: KColor.issueQuestionColor, fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
                alignment: Alignment.centerLeft,
                //常见问题:答
                child: Text(
                  issue.answer,
                  style: TextStyle(color: KColor.issueAnswerColor, fontSize: 14.0),
                )),
          ],
        ));
  }
}
