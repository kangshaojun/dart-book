//page/user/register_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/component/item_text_field.dart';
//注册页面
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  //用户名文本编辑控制器
  TextEditingController _userNameController;
  //密码文本编辑控制器
  TextEditingController _pwdController;
  //手机号文本编辑控制器
  TextEditingController _mobileController;
  //地址文本编辑控制器
  TextEditingController _addressController;
  //用户名焦点节点
  FocusNode _userNameNode = FocusNode();
  //手机号焦点节点
  FocusNode _mobileNode = FocusNode();
  //密码焦点节点
  FocusNode _pwdNode = FocusNode();
  //地址焦点节点
  FocusNode _addressNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //实例化用户名控制器
    _userNameController = TextEditingController();
    //实例化密码控制器
    _pwdController = TextEditingController();
    //实例化手机号控制器
    _mobileController = TextEditingController();
    //实例化地址控制器
    _addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //注册页面
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColor.PRIMARY_COLOR,
        elevation: 0,
        //注册标题
        title: Text(KString.REGISTER_TITLE),
        centerTitle: true,
      ),
      //可滚动视图
      body: SingleChildScrollView(
        //垂直布局
        child: Column(
          //水平居左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Logo展示
            LogoContainer(),
            SizedBox(
              height: 80,
            ),
            //注册输入框组件
            _registContent(context),
            //注册按钮
            KBigButton(
              text:KString.REGISTER_TITLE,
              //点击注册
              onPressed:(){
                if(_checkInput()){
                  this._register();
                }
            },),
          ],
        ),
      ),
    );
  }

  //注册内容
  Widget _registContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          //用户名标题
          _itemTitle(KString.USERNAME),
          SizedBox(
            height: 10,
          ),
          //用户名输入框
          ItemTextField(
            icon: Icon(Icons.person),
            controller: _userNameController,
            focusNode: _userNameNode,
            title: KString.USERNAME,
            hintText: KString.PLEASE_INPUT_NAME,
          ),
          SizedBox(height: 20.0),
          //手机号标题
          _itemTitle(KString.MOBILE),
          SizedBox(
            height: 10,
          ),
          //手机号输入框
          ItemTextField(
            icon: Icon(Icons.phone),
            controller: _mobileController,
            focusNode: _mobileNode,
            title: KString.MOBILE,
            hintText: KString.PLEASE_INPUT_MOBILE,
          ),
          SizedBox(height: 20.0),
          //密码标题
          _itemTitle(KString.PASSWORD),
          SizedBox(
            height: 10,
          ),
          //密码输入框
          ItemTextField(
            icon: Icon(Icons.lock),
            controller: _pwdController,
            focusNode: _pwdNode,
            title: KString.PASSWORD,
            hintText: KString.PLEASE_INPUT_PWD,
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          //地址标题
          _itemTitle(KString.ADDRESS),
          SizedBox(
            height: 10,
          ),
          //地址输入框
          ItemTextField(
            icon: Icon(Icons.home),
            controller: _addressController,
            focusNode: _addressNode,
            title: KString.ADDRESS,
            hintText: KString.PLEASE_INPUT_ADDRESS,
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  //自定义标题
  Widget _itemTitle(String title){
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      ),
    );
  }

  //检测输入框内容是否为空
  bool _checkInput(){
    if(_userNameController.text.length == 0){
      MessageWidget.show(KString.PLEASE_INPUT_NAME);
      return false;
    }
    else if (_pwdController.text.length == 0){
      MessageWidget.show(KString.PLEASE_INPUT_PWD);
      return false;
    }
    else if (_mobileController.text.length == 0){
      MessageWidget.show(KString.PLEASE_INPUT_MOBILE);
      return false;
    }
    else if (_addressController.text.length == 0){
      MessageWidget.show(KString.PLEASE_INPUT_ADDRESS);
      return false;
    }
    return true;
  }

  //注册
  _register() async {
    //注册参数
    var formData = {
      //用户名
      'username':_userNameController.text.toString(),
      //密码
      'password':_pwdController.text.toString(),
      //手机号
      'mobile':_mobileController.text.toString(),
      //地址
      'address':_addressController.text.toString(),
    };
    //调用注册接口并传递参数
    var response = await HttpService.post(ApiUrl.USER_REGISTER,param:formData);
    //判断返回code值
    if(response['code'] == 0) {
      //将Json数据转换成用户数据模型
      UserModel model = UserModel.fromJson(response['data']);
      print(model.username);
      //跳转至个人中心页面
      RouterUtil.toMemberPage(context);
      //弹出注册成功消息
      MessageWidget.show(KString.REGISTER_SUCCESS);
    }else{
      //弹出注册失败消息
      MessageWidget.show(KString.REGISTER_FAILED);
    }
  }

}


