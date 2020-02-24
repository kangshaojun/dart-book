//page/login/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/config/index.dart';
import 'package:shop/service/user_service.dart';
import 'package:shop/model/user_model.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/event/login_event.dart';
import 'package:shop/utils/shared_preferences_util.dart';

//登录页面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //账号文本控制器
  TextEditingController _accountTextControl = TextEditingController();
  //密码文本控制器
  TextEditingController _passwordTextControl = TextEditingController();
  //用户数据服务
  UserService userService = UserService();
  //用户数据模型
  UserModel userModel;
  //是否自动验证
  bool _autovalidator = false;
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            alignment: Alignment.centerLeft,
            //登录框居中
            child: Center(
                child: SingleChildScrollView(
                  //登录框容器
                  child: Container(
                    margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30.0), 0, ScreenUtil().setWidth(30.0), 0),
                    height: ScreenUtil.instance.setHeight(800.0),
                    //外框样式
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    //Form表单
                    child: Form(
                      key: registerFormKey,
                      //垂直布局,上面为账号,下面为密码
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(60.0))),
                          Container(
                            margin: EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                            //账号输入框
                            child: TextFormField(
                              //单行
                              maxLines: 1,
                              maxLength: 11,
                              //自动验证
                              autovalidate: _autovalidator,
                              //弹出键盘为数字
                              keyboardType: TextInputType.phone,
                              //验证回调方法
                              validator: _validatorAccount,
                              //边框样式
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: KColor.loginIconColor,
                                  size: ScreenUtil.instance.setWidth(60.0),
                                ),
                                //提示输入账号
                                hintText: KString.ACCOUNT_HINT,
                                //提示文本样式
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil.instance.setSp(28.0)),
                                //账号文本样式
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ScreenUtil.instance.setSp(28.0)),
                                //账号文本
                                labelText: KString.ACCOUNT,
                              ),
                              //控制器
                              controller: _accountTextControl,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                            //密码输出框
                            child: TextFormField(
                              //单行
                              maxLines: 1,
                              maxLength: 12,
                              //密码显示
                              obscureText: true,
                              //自动验证
                              autovalidate: _autovalidator,
                              //验证回调方法
                              validator: _validatorPassWord,
                              //边框样式
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: KColor.loginIconColor,
                                  size: ScreenUtil.instance.setWidth(60.0),
                                ),
                                //密码提示文本
                                hintText: KString.PASSWORD_HINT,
                                //密码提示文本样式
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil.instance.setSp(28.0)),
                                //密码标签样式
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ScreenUtil.instance.setSp(28.0)),
                                //密码标签
                                labelText: KString.PASSWORD,
                              ),
                              //控制器
                              controller: _passwordTextControl,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                              child: SizedBox(
                                height: ScreenUtil.instance.setHeight(80.0),
                                width: ScreenUtil.instance.setWidth(600.0),
                                //登录按钮
                                child: RaisedButton(
                                  //登录方法
                                  onPressed: _login,
                                  color: KColor.loginButtonColor,
                                  child: Text(
                                    KString.LOGIN,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil.instance.setSp(28.0)),
                                  ),
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              //点击跳转至注册页面
                              onTap: () => _register(),
                              child: Text(
                                //马上注册提示文本
                                KString.NOW_REGISTER,
                                style: TextStyle(
                                  color: KColor.registerTextColor,
                                  fontSize: ScreenUtil.instance.setSp(24.0)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            ))),
      ),
    );
  }

  //跳转至注册页面
  _register() {
    NavigatorUtil.goRegister(context);
  }
  //验证账号
  String _validatorAccount(String value) {
    //值不能为空并且长度要大于等于11
    if (value == null || value.length < 11) {
      return KString.ACCOUNT_RULE;
    }
    return null;
  }
  //验证密码
  String _validatorPassWord(String value) {
    //值不能为空并且长度要大于等于6
    if (value == null || value.length < 6) {
      return KString.PASSWORD_HINT;
    }
    return null;
  }
  //登录
  _login() {
    //登录之前执行验证
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      //登录参数
      Map<String, dynamic> map = Map();
      //设置密码参数
      map.putIfAbsent("username", () => _accountTextControl.text.toString());
      //设置账号参数
      map.putIfAbsent("password", () => _passwordTextControl.text.toString());
      //调用用户服务执行登录方法
      userService.login(map, (success) {
        print(success);
        //返回登录数据,赋值给用户数据模型
        userModel = success;
        _saveUserInfo();
        //登录成功提示
        _showToast(KString.LOGIN_SUCESS);
        //触发登录事件,通知购物车或我的页面此用户已经登录成功
        loginEventBus.fire(LoginEvent(true,url: userModel.userInfo.avatarUrl,nickName: userModel.userInfo.nickName));
        Navigator.pop(context);
      }, (onFail) {
        print(onFail);
        //弹出错误信息
        _showToast(onFail);
      });
    } else {
      setState(() {
        _autovalidator = true;
      });
    }
  }

  //提示消息
  _showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: KColor.toastBgColor,
        textColor: KColor.toastTextColor,
        fontSize: ScreenUtil.instance.setSp(28.0));
  }

  //保存用户信息至本地
  _saveUserInfo() async {
    //获取本地存储对象
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //将用户的token值存在本地
    SharedPreferencesUtil.token = userModel.token;
    await sharedPreferences.setString(KString.TOKEN, userModel.token);
    //存储头像
    await sharedPreferences.setString(KString.HEAD_URL, userModel.userInfo.avatarUrl);
    //存储昵称
    await sharedPreferences.setString(KString.NICK_NAME, userModel.userInfo.nickName);
  }
}
