//page/mine/mine_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/config/index.dart';
import 'package:shop/utils/shared_preferences_util.dart';
import 'package:shop/widgets/icon_text_arrow_widget.dart';
import 'package:shop/config/icon.dart';
import 'package:shop/utils/navigator_util.dart';
import 'package:shop/event/login_event.dart';
import 'package:shop/service/user_service.dart';
import 'package:shop/utils/toast_util.dart';
//我的页面
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  //是否登录变量
  bool isLogin = false;
  //头像地址
  var imageHeadUrl;
  //昵称
  var nickName;
  //用户数据服务
  UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    //获取用户信息
    _getUserInfo();
  }
  //刷新事件
  _refreshEvent() {
    //登录事件监听
    loginEventBus.on<LoginEvent>().listen((LoginEvent loginEvent) {
      if (loginEvent.isLogin) {
        setState(() {
          //登录成功
          isLogin = true;
          //设置头像url
          imageHeadUrl = loginEvent.url;
          //设置昵称
          nickName = loginEvent.nickName;
        });
      } else {
        setState(() {
          isLogin = false;
        });
      }
    });
  }

  //获取本地用户信息
  _getUserInfo() {
    //获取token
    SharedPreferencesUtil.getToken().then((token) {
      if (token != null) {
        setState(() {
          isLogin = true;
        });
        //获取本地头像数据
        SharedPreferencesUtil.getImageHead().then((imageHeadAddress) {
          setState(() {
            imageHeadUrl = imageHeadAddress;
          });
        });
        //获取本地用户名数据
        SharedPreferencesUtil.getUserName().then((name) {
          setState(() {
            nickName = name;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //刷新事件
    _refreshEvent();
    return Scaffold(
      appBar: AppBar(
        //标题
        title: Text(KString.MINE),
        centerTitle: true,
      ),
      //垂直布局
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(160.0),
            width: double.infinity,
            alignment: Alignment.center,
            //判断是否登录
            child: isLogin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(20.0),
                        ),
                        //显示头像
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.redAccent,
                          //头像图片
                          backgroundImage: NetworkImage(
                            imageHeadUrl,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(10.0)),
                      ),
                      //昵称
                      Text(
                        nickName,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(26.0),
                            color: Colors.black),
                      ),
                      Expanded(
                        //退出按钮
                        child: InkWell(
                          //打开退出对话框
                          onTap: () => _loginOutDialog(),
                          child: Offstage(
                            //登录后显示此组件
                            offstage: !isLogin,
                            child: Container(
                              padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(30)),
                              alignment: Alignment.centerRight,
                              //登出文本
                              child: Text(
                                KString.LOGIN_OUT,
                                style: TextStyle(
                                    fontSize: ScreenUtil.getInstance().setSp(26),
                                    color: Colors.black54),
                              ),
                            ),
                          )),
                      ),
                    ],
                  )
                : InkWell(
                    //点击登录
                    onTap: () => _toLogin(),
                    //登录文本
                    child: Text(
                      KString.CLICK_LOGIN,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil.getInstance().setSp(30.0)),
                    ),
                  ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(20.0)),
          ),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          //我的订单
          IconTextArrowWidget(
              KIcon.ORDER, KString.ORDER, Colors.deepPurpleAccent, _order),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          //收藏
          IconTextArrowWidget(
              KIcon.COLLECTION, KString.COLLECTION, Colors.red, _collect),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          //地址管理
          IconTextArrowWidget(
              KIcon.ADDRESS, KString.ADDRESS, Colors.amber, _address),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          //关于我们
          IconTextArrowWidget(
              KIcon.ABOUT_US, KString.ABOUT_US, Colors.teal, _aboutUs),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
        ],
      ),
    );
  }

  //登出对话框
  _loginOutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //对话框
          return AlertDialog(
            //提示
            title: Text(
              KString.TIPS,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  color: Colors.black54),
            ),
            //登出提示
            content: Text(
              KString.LOGIN_OUT_TIPS,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  color: Colors.black54),
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
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              //确定按钮
              FlatButton(
                //跳转到登录页面
                onPressed: () => _loginOut(),
                child: Text(
                  KString.CONFIRM,
                  style: TextStyle(color: KColor.defaultTextColor),
                ),
              )
            ],
          );
        });
  }

  //登出方法
  _loginOut() {
    //调用用户数据服务的登出方法
    _userService.loginOut((success) {
      //触发LoginEvent事件
      loginEventBus.fire(LoginEvent(false));
    }, (error) {
      //触发LoginEvent事件
      loginEventBus.fire(LoginEvent(false));
      ToastUtil.showToast(error);
    });
    Navigator.pop(context);
  }
  //跳转至我的收藏页面
  void _collect() {
    if (isLogin) {
      NavigatorUtil.goCollect(context);
    } else {
      _toLogin();
    }
  }
  //跳转至收获地址页面
  void _address() {
    if (isLogin) {
      NavigatorUtil.goAddress(context);
    } else {
      _toLogin();
    }
  }
  //跳转至关于我们页面
  void _aboutUs() {
    if (isLogin) {
      NavigatorUtil.goAboutUs(context);
    } else {
      _toLogin();
    }
  }
  //跳转至我的订单页面
  void _order() {
    if (isLogin) {
      NavigatorUtil.goOrder(context);
    } else {
      _toLogin();
    }
  }
  //跳转至登录页面
  _toLogin() {
    NavigatorUtil.goLogin(context);
  }
}
