//page/mine/collect_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/service/collect_service.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/model/collect_list_model.dart';
import 'package:shop/utils/toast_util.dart';
import 'package:shop/config/index.dart';
import 'package:shop/widgets/no_data_widget.dart';
import 'package:shop/utils/navigator_util.dart';
//收藏页面
class CollectPage extends StatefulWidget {
  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  //收藏数据服务
  CollectService _collectService = CollectService();
  //收藏列表
  List<CollectModel> _collects = List();
  //token值
  var token;
  //当前页
  var _page = 1;
  //每页个数
  var _limit = 10;
  //类型
  var _type = 0;

  @override
  void initState() {
    super.initState();
    //获取token值
    SharedPreferencesUtil.getToken().then((value) {
      token = value;
      //查询
      _queryCollect();
    });
  }

  //查询收藏数据
  _queryCollect() {
    //参数
    var parameters = {"type": _type, "page": _page, "limit": _limit};
    _collectService.queryCollect(parameters,(successList) {
      setState(() {
        _collects = successList;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //我的收藏标题
        title: Text(KString.MINE_COLLECT),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: _collects.length == 0
            //没有数据组件
            ? NoDataWidget()
            //GridView展示商品
            : GridView.builder(
                //商品个数
                itemCount: _collects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //一行两列
                  crossAxisCount: 2,
                  mainAxisSpacing: ScreenUtil.instance.setWidth(10.0),
                  crossAxisSpacing: ScreenUtil.instance.setHeight(10.0)),
                  itemBuilder: (BuildContext context, int index) {
                    //根据索引返回商品项
                    return getGoodsItemWidget(_collects[index], index);
                  },
              ),
      ),
    );
  }

  //返回商品项
  Widget getGoodsItemWidget(CollectModel collect, int index) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: 320,
            height: 460,
            child: Card(
              //垂直布局
              child: Column(
                children: <Widget>[
                  //商品图片
                  Image.network(
                    collect.picUrl ?? "",
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  //商品名称
                  Text(
                    collect.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  //商品价格
                  Text(
                    "¥${collect.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14.0, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            )),
      ),
      //点击商品处理
      onTap: () => _itemClick(collect.valueId),
      //长按商品处理
      onLongPress: () => _showDeleteDialog(collect, index),
    );
  }

  //弹出取消收藏商品对话框
  _showDeleteDialog(CollectModel collect, int index) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            //提示文本
            title: Text(
              KString.TIPS,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(28.0)),
            ),
            //取消提示文本
            content: Text(
              KString.MINE_CANCEL_COLLECT,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            //操作按钮
            actions: <Widget>[
              //取消按钮
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    KString.CANCEL,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              //确定按钮
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //删除处理
                    _cancelCollect(collect.valueId, index);
                  },
                  child: Text(
                    KString.CONFIRM,
                    style: TextStyle(
                        color: KColor.defaultTextColor,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
            ],
          );
        });
  }
  //取消收藏处理
  _cancelCollect(int valueId, int index) {
    //type为0表示取消收藏,商品Id
    var parameters = {"type": 0, "valueId": valueId};
    _collectService.addOrDeleteCollect(parameters, (onSuccess) {
      setState(() {
        //本地删除此商品
        _collects.removeAt(index);
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }
  //点击跳转至商品详情页
  _itemClick(int id) {
    NavigatorUtil.goGoodsDetails(context, id);
  }
}
