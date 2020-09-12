//page/user/login_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/component/item_text_field.dart';
//登录页面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //用户名文本编辑控制器
  TextEditingController _userNameController;
  //密码文本编辑控制器
  TextEditingController _pwdController;
  //用户名焦点节点
  FocusNode _userNameNode = FocusNode();
  //密码焦点节点
  FocusNode _pwdNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //实例化用户名控制器
    _userNameController = TextEditingController();
    //实例化密码控制器
    _pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //登录标题
      appBar: AppBar(
        backgroundColor: KColor.PRIMARY_COLOR,
        elevation: 0,
        title: Text(KString.LOGIN_TITLE),
        centerTitle: true,
      ),
      //滚动视图
      body: SingleChildScrollView(
        //垂直布局
        child: Column(
          //水平方向左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //登录Logo
            LogoContainer(),
            SizedBox(
              height: 80,
            ),
            //用户与密码输入框
            _textInputContent(context),
            SizedBox(
              height: 20,
            ),
            //登录按钮
            KBigButton(
              text:KString.LOGIN_TITLE,
              //点击操作
              onPressed:(){
                //检测输入值
                if(_checkInput()){
                  this._login();
                }
            },),
            //水平布局
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //忘记密码按钮
                _forgetPasswordButton(),
                //注册按钮
                _registerButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //用户名与密码输入框
  Widget _textInputContent(BuildContext context) {
    //容器
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      //垂直布局
      child: Column(
        children: <Widget>[
          //用户名输入框
          ItemTextField(
              icon:Icon(Icons.person),
              controller:_userNameController,
              focusNode:_userNameNode,
              title:KString.USERNAME,
              hintText:KString.PLEASE_INPUT_NAME),
          SizedBox(height: 20.0),
          //密码输入框
          ItemTextField(
              icon:Icon(Icons.lock),
              controller:_pwdController,
              focusNode:_pwdNode,
              title:KString.PASSWORD,
              hintText:KString.PLEASE_INPUT_PWD,
              obscureText:true),
        ],
      ),
    );
  }

  //忘记密码按钮
  Widget _forgetPasswordButton(){
    //容器
    return Container(
      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(40.0)),
      //按钮
      child: InkWell(
        child: Text(
          KString.FORGET_PASSWORD,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil.instance.setSp(28.0),
          ),
        ),
      ),
    );
  }

  //注册按钮
  Widget _registerButton(){
    //容器
    return Container(
      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(40.0)),
      //按钮
      child: InkWell(
        //点击跳转至注册页面
        onTap: (){
          RouterUtil.toRegisterPage(context);
        },
        //按钮文本
        child: Text(
          KString.FAST_REGISTER,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil.instance.setSp(28.0),
          ),
        ),
      ),
    );
  }

  //检测输入框是否为空
  bool _checkInput(){
    if(_userNameController.text.length == 0){
      MessageWidget.show(KString.PLEASE_INPUT_NAME);
      return false;
    }
    else if (_pwdController.text.length == 0){
      MessageWidget.show(KString.PLEASE_INPUT_PWD);
      return false;
    }
    return true;
  }

  //登录
  _login() async {
    //登录参数
    var formData = {
      //用户名
      'username':_userNameController.text.toString(),
      //密码
      'password':_pwdController.text.toString(),
    };

    //调用登录接口并传递参数
    var response = await HttpService.post(ApiUrl.USER_LOGIN,param:formData);
    //成功返回
    if(response['code'] == 0){
      //将Json数据转换成用户数据模型
      UserModel model = UserModel.fromJson(response['data']);
      //弹框显示登录成功消息
      MessageWidget.show(KString.LOGIN_SUCCESS);
      //保存登录用户信息
      await TokenUtil.saveLoginInfo(model);

      //定义登录成功消息
      var data = {
        //用户名
        'username':model.username,
        //是否登录
        'isLogin':true,
      };
      //派发登录成功消息
      Call.dispatch(Notify.LOGIN_STATUS, data: data);

      //返回上一个界面
      RouterUtil.pop(context);
    }else{

      //弹框显示登录失败消息
      MessageWidget.show(KString.LOGIN_FAILED);
      //定义登录失败消息
      var data = {
        //用户名
        'username':'',
        //是否登录
        'isLogin':false,
      };
      //派发登录失败消息
      Call.dispatch(Notify.LOGIN_STATUS, data: data);
    }
  }
}


