//page/mine/address_edit_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:shop/config/index.dart';
import 'package:shop/model/address_model.dart';
import 'package:shop/service/address_service.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/utils/toast_util.dart';
//编辑地址页面
class AddressEditPage extends StatefulWidget {
  //地址Id
  var addressId;
  //传入地址Id参数
  AddressEditPage(this.addressId);

  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  //名称文本编辑控制器
  TextEditingController _nameController;
  //电话文本编辑控制器
  TextEditingController _phoneController = TextEditingController();
  //详情地址文本编辑控制器
  TextEditingController _addressDetailController = TextEditingController();
  //地址数据服务
  AddressService _addressService = AddressService();
  //地址列表数据
  AddressModel _addressData;
  var _cityText;
  //是否为默认地址
  var _isDefault = false;
  //地址Id
  var _addressId;
  var token;
  //地址Id
  var _areaId;
  //省
  var _provinceName;
  //城市
  var _cityName;
  //国家
  var _countryName;
  Options options = Options();

  @override
  void initState() {
    super.initState();
    //读取传入的地址Id
    _addressId = widget.addressId;
    //获取本地Token
    SharedPreferencesUtil.getToken().then((onValue) {
      if (onValue != null) {
        token = onValue;
      }
      //_addressId为0表示新增,否则为编辑
      if (_addressId != 0) {
        //查询详细地址数据
        _queryAddressDetail(onValue);
      } else {
        _initController();
      }
    });
  }

  //文本框初始化值
  _initController() {
    //用户名初始化
    _nameController = TextEditingController(
      text: _addressData == null ? "" : _addressData.name,
    );
    //电话号码初始化
    _phoneController = TextEditingController(
      text: _addressData == null ? "" : _addressData.tel,
    );
    //详细地址初始化
    _addressDetailController = TextEditingController(
      text: _addressData == null ? "" : _addressData.addressDetail,
    );
  }
  //查询地址数据
  _queryAddressDetail(var token) {
    //地址Id参数
    var parameters = {"id": _addressId};
    //查询地址详情
    _addressService.addressDetail(parameters, (addressDetail) {
      setState(() {
        //根据返回的数据赋值给本地变量
        _addressData = addressDetail;
        _areaId = _addressData.areaCode;
        _cityText = _addressData.province + _addressData.city + _addressData.county;
        _isDefault = _addressData.isDefault;
        _provinceName = _addressData.province;
        _cityName = _addressData.city;
        _countryName = _addressData.county;
      });
      _initController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //标题
        title: Text(KString.ADDRESS_EDIT_TITLE),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20.0),
            right: ScreenUtil.instance.setWidth(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //名称
            TextField(
                maxLines: 1,
                controller: _nameController,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                decoration: InputDecoration(
                  //请输入名称提示
                  hintText: KString.ADDRESS_PLEASE_INPUT_NAME,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)))),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            //电话
            TextField(
                maxLines: 1,
                controller: _phoneController,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                decoration: InputDecoration(
                  //请输入地址提示
                  hintText: KString.ADDRESS_PLEASE_INPUT_PHONE,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)))),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            InkWell(
                //弹出城市选择组件
                onTap: () => this.show(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil.instance.setHeight(100),
                  child: Text(
                    _cityText == null
                    //请选择城市提示
                        ? KString.ADDRESS_PLEASE_SELECT_CITY
                        : _cityText,
                    style: _cityText == null
                        ? TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.instance.setSp(26.0))
                        : TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                )),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            //详细地址
            TextField(
                maxLines: 1,
                controller: _addressDetailController,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil.instance.setSp(26.0)),
                decoration: InputDecoration(
                  //请输入详细地址提示
                  hintText: KString.ADDRESS_PLEASE_INPUT_DETAIL,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)))),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(100.0),
              //水平布局
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //默认地址提示
                  Text(
                    KString.ADDRESS_SET_DEFAULT,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    //设置是否为默认地址
                    child: Switch(
                        value: _isDefault,
                        activeColor: KColor.defaultSwitchColor,
                        //选择改变回调方法
                        onChanged: (bool) {
                          setState(() {
                            //设置默认地址状态值
                            this._isDefault = bool;
                          });
                        }),
                  )),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[350],
              height: ScreenUtil.instance.setHeight(1.0),
            ),
            //当地址Id为0时不显示删除地址按钮
            Offstage(
              offstage: _addressId == 0,
              child: InkWell(
                  //删除地址
                  onTap: () => _deleteAddressDialog(context),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil.instance.setHeight(100),
                    child: Text(
                      //删除地址文本
                      KString.ADDRESS_DELETE,
                      style: TextStyle(
                          color: KColor.defaultButtonColor,
                          fontSize: ScreenUtil.instance.setSp(26.0)),
                    ),
                  )),
            ),
            //当地址Id为0时不显示删除地址按钮
            Offstage(
                offstage: _addressId == 0,
                child: Divider(
                  color: Colors.grey[350],
                  height: ScreenUtil.instance.setHeight(1.0),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: KColor.defaultButtonColor,
            height: ScreenUtil.instance.setHeight(100.0),
            child: InkWell(
              //提交地址操作
              onTap: () => _addAddress(),
              child: Text(
                //提交文本
                KString.SUBMIT,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.instance.setSp(28.0)),
              ),
            )),
      ),
    );
  }

  //弹出地址选择组件
  show(context) async {
    //使用CityPickers组件弹出城市选择框
    Result temp = await CityPickers.showCityPicker(
      context: context,
      itemExtent: ScreenUtil.instance.setHeight(80.0),
      itemBuilder: (item, list, index) {
        return Center(
            child: Text(
                item,
                maxLines: 1,
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(26.0)
                )
            ),
        );
      },
      height: ScreenUtil.instance.setHeight(400),
    );

    print(temp);
    setState(() {
      //设置选择好的地址信息
      _cityText = temp.provinceName + temp.cityName + temp.areaName;
      _areaId = temp.areaId;
      _provinceName = temp.provinceName;
      _cityName = temp.cityName;
      _countryName = temp.areaName;
    });
  }

  //删除地址
  _deleteAddressDialog(BuildContext context) {
    //弹出对话框
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            //提示文本
            title: Text(
              KString.TIPS,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(30.0),
                  color: Colors.black54),
            ),
            //删除收货地址提示文本
            content: Text(
              KString.ADDRESS_DELETE,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(30.0),
                  color: Colors.black54),
            ),
            actions: <Widget>[
              //取消删除按钮
              FlatButton(
                color: Colors.white,
                //取消删除
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  KString.CANCEL,
                  style: TextStyle(
                      color: KColor.defaultButtonColor,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
              ),
              //删除按钮
              FlatButton(
                color: Colors.white,
                //删除收货地址
                onPressed: () {
                  Navigator.pop(context);
                  _deleteAddress();
                },
                child: Text(
                  KString.CONFIRM,
                  style: TextStyle(
                      color: KColor.defaultButtonColor,
                      fontSize: ScreenUtil.instance.setSp(26.0)),
                ),
              ),
            ],
          );
        });
  }

  //删除地址
  _deleteAddress() {
    //地址Id参数
    var parameters = {"id": _addressData.id};
    //调用地址服务执行删除
    _addressService.deleteAddress( parameters, (onSuccess) {
      //删除成功提示
      ToastUtil.showToast(KString.ADDRESS_DELETE_SUCCESS);
      Navigator.pop(context);
    }, (onFail) {
      ToastUtil.showToast(onFail);
    });
  }

  //新增地址提交
  _addAddress() {
    //首先判断地址数据
    if (_checkAddressBody()) {
      var parameters = {
        //详细地址
        "addressDetail": _addressDetailController.text.toString(),
        //地区编码
        "areaCode": _areaId,
        //城市
        "city": _cityName,
        //国家
        "county": _countryName,
        //地址Id
        "id": _addressData == null ? 0 : _addressData.id,
        //是否为默认地址
        "isDefault": _isDefault,
        //姓名
        "name": _nameController.text.toString(),
        //省
        "province": _provinceName,
        //电话
        "tel": _phoneController.text.toString(),
      };
      //调用地址数据服务添加地址
      _addressService.addAddress( parameters, (success) {
        //添加成功提示
        ToastUtil.showToast(KString.SUBMIT_SUCCESS);
        Navigator.of(context).pop(true);
      }, (error) {
        ToastUtil.showToast(error);
      });
    }
  }

  //判断地址信息是否完整
  bool _checkAddressBody() {
    //判断详细地址是否为空
    if (_addressDetailController.text.toString().isEmpty) {
      ToastUtil.showToast(KString.ADDRESS_PLEASE_INPUT_DETAIL);
      return false;
    }
    //判断名称是否为空
    if (_nameController.text.toString().isEmpty) {
      ToastUtil.showToast(KString.ADDRESS_PLEASE_INPUT_NAME);
      return false;
    }
    //判断电话是否为空
    if (_phoneController.text.toString().isEmpty) {
      ToastUtil.showToast(KString.ADDRESS_PLEASE_INPUT_PHONE);
      return false;
    }
    return true;
  }
}
