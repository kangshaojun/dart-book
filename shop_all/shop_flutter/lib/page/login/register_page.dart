//page/login/register_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/config/index.dart';
import 'package:shop/config/icon.dart';
import 'package:shop/service/user_service.dart';
import 'package:shop/utils/navigator_util.dart';
//注册页面
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //账号文本控制器
  TextEditingController _accountTextControl = TextEditingController();
  //密码文本控制器
  TextEditingController _passwordTextControl = TextEditingController();
  //用户数据服务
  UserService userService = UserService();
  //是否自动验证
  bool _autovalidator = false;
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //注册框居中
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30.0), 0, ScreenUtil().setWidth(30.0), 0),
              height: ScreenUtil.instance.setHeight(700.0),
              //边框样式
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
              //注册表单
              child: Form(
                key: registerFormKey,
                //垂直布局
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(60.0))),
                    Container(
                      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                      //账号输入表单
                      child: TextFormField(
                        //单行显示
                        maxLines: 1,
                        maxLength: 11,
                        //自动验证
                        autovalidate: _autovalidator,
                        //数字键盘
                        keyboardType: TextInputType.phone,
                        //账号验证方法
                        validator: _validatorAccount,
                        //边框样式
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: KColor.registerIconColor,
                            size: ScreenUtil.instance.setWidth(60.0),
                          ),
                          //提示文本
                          hintText: KString.ACCOUNT_HINT,
                          //提示文本样式
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.instance.setSp(28.0)),
                          //账号标签文本样式
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenUtil.instance.setSp(28.0)),
                          //账号标签文本
                          labelText: KString.ACCOUNT,
                        ),
                        //控制器
                        controller: _accountTextControl,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenUtil.instance.setWidth(30.0)),
                      //密码输入表单
                      child: TextFormField(
                        //单行
                        maxLines: 1,
                        maxLength: 12,
                        //自动验证
                        autovalidate: _autovalidator,
                        //验证方法
                        validator: _validatorPassWord,
                        //边框样式
                        decoration: InputDecoration(
                          icon: Icon(
                            KIcon.PASS_WORD,
                            color: KColor.registerIconColor,
                            size: ScreenUtil.instance.setWidth(60.0),
                          ),
                          //请输入密码提示
                          hintText: KString.PASSWORD_HINT,
                          //请输入密码提示样式
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.instance.setSp(28.0)),
                          //密码标签文本样式
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenUtil.instance.setSp(28.0)),
                          //密码标签文本
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
                          //注册按钮
                          child: RaisedButton(
                            onPressed: _register,
                            color: KColor.registerButtonColor,
                            child: Text(
                              //注册文本
                              KString.REGISTER,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil.instance.setSp(28.0)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
      )),
    );
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

  //提示注册消息
  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: KColor.toastBgColor,
        textColor: KColor.toastTextColor,
        fontSize: ScreenUtil.instance.setSp(28.0));
  }

  //注册
  _register() {
    //提交注册前先验证
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      //注册参数
      Map<String, dynamic> map = Map();
      //用户名
      map.putIfAbsent("username", () => _accountTextControl.text.toString());
      //密码
      map.putIfAbsent("password", () => _passwordTextControl.text.toString());
      //电话号码
      map.putIfAbsent("mobile", () => _accountTextControl.text.toString());
      //验证码
      map.putIfAbsent("code", () => "8888"); //测试验证码写死8888
      //调用用户服务的注册方法
      userService.register(map, (success) {
        print(success);
        //注册成功后提示
        _showToast(KString.REGISTER_SUCCESS);
        //注册成功返回上级页面
        NavigatorUtil.popRegister(context);
      }, (onFail) {
        print(onFail);
        _showToast(onFail);
      });
    } else {
      setState(() {
        _autovalidator = true;
      });
    }
  }
}
