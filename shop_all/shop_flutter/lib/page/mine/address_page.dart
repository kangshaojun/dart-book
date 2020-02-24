//page/mine/address_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/address_model.dart';
import 'package:shop/service/address_service.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/utils/fluro_convert_util.dart';
import 'package:shop/widgets/no_data_widget.dart';
//地址修改页面
class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  //地址列表数据
  List<AddressModel> _addressData;
  //地址数据服务
  AddressService addressService = AddressService();
  //地址Future对象
  var addressFuture;
  //token值
  var token;

  @override
  void initState() {
    super.initState();
    //获取收货地址数据
    _getAddressData();
  }

  //获取收货地址数据
  _getAddressData() {
    addressService.getAddressList((addressList) {
      setState(() {
        _addressData = addressList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //标题
        title: Text(KString.MY_ADDRESS),
        centerTitle: true,
        //页面右上角操作按钮
        actions: <Widget>[
          InkWell(
            child: Container(
            margin: EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
            alignment: Alignment.center,
            child: InkWell(
              //跳转至添加地址页面,0表示添加地址
              onTap: () => _goAddressEdit(0),
              child: Text(KString.ADD_ADDRESS),
            ),
          ))
        ],
      ),
      body: _addressData != null && _addressData.length > 0
          ? Container(
              //地址列表
              child: ListView.builder(
                //地址列表长度
                itemCount: _addressData.length,
                itemBuilder: (BuildContext context, int index) {
                  return _addressItemView(_addressData[index]);
                }))
            //没有数据提示组件
          : NoDataWidget(),
    );
  }

  //地址列表项组件,根据地址数据渲染地址信息
  Widget _addressItemView(AddressModel addressData) {
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
      height: ScreenUtil.instance.setHeight(160.0),
      alignment: Alignment.center,
      //卡片布局
      child: Card(
        //点击返回至填写订单界面并带上地址数据
        child: InkWell(
        onTap: () => _goFillInOrder(addressData),
        //水平布局
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              //垂直布局
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //水平布局
                Row(
                  children: <Widget>[
                    //姓名
                    Text(
                      addressData.name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(10.0))),
                    //电话
                    Text(
                      addressData.tel,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.instance.setWidth(20.0))),
                //省
                Text(
                  addressData.province +
                      addressData.city +
                      addressData.county +
                      addressData.addressDetail,
                  //最多两行展示
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // 显示不完，就在后面显示点点
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0),
                  ),
                )
              ],
            )),
            Container(
                width: ScreenUtil.instance.setWidth(120.0),
                margin:
                    EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: Border(
                        left: BorderSide(
                            color: Colors.grey[350],
                            width: ScreenUtil.instance.setWidth(1.0)))),
                padding:
                    EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                //点击跳转至编辑页面
                child: InkWell(
                  onTap: () => _goAddressEdit(addressData.id),
                  //编辑标签
                  child: Text(
                    KString.ADDRESS_EDIT,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                ))
          ],
        ),
      )),
    );
  }
  //跳转至填写订单页面
  _goFillInOrder(AddressModel addressData) {
    Navigator.of(context).pop(FluroConvertUtil.objectToString(addressData));
  }
  //跳转至编辑页面,传入地址Id参数
  _goAddressEdit(var addressId) {
    NavigatorUtil.goAddressEdit(context, addressId).then((bool) {
      _getAddressData();
    });
  }
}
