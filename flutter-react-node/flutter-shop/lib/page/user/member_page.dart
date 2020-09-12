//page/user/member_page.dart文件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notify.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/component/show_message.dart';
//会员中心页面
class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  //是否登录
  bool _isLogin = false;
  //用户名
  String _username = '';

  @override
  void initState() {
    super.initState();
    //添加登录状态回调函数
    Call.addCallBack(Notify.LOGIN_STATUS, this._loginCallBack);
    //检查是否登录
    _checkLogin();
  }

  //判断是否登录
  _checkLogin() async{
    //读取登录状态
    bool login = await TokenUtil.isLogin();
    //获取登录用户信息
    var user = await TokenUtil.getUserInfo();
    //设置登录状态及登录用户信息
    this.setState(() {
      _isLogin = login;
      _username = user['username'];
    });
  }

  //登录回调函数
  _loginCallBack(data){
    //判断是否登录
    if(data['isLogin']){
      this.setState(() {
        //登录成功获取用户名
        _username = data['username'];
        //设置登录状态为true
        _isLogin = true;
      });
    }else{
      //清空用户名
      _username = '';
      //设置登录状态为false
      _isLogin = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //会员中心页面
    return Scaffold(
      //使用列表垂直布局
      body: ListView(
        children: <Widget>[
          //容器
          Container(
            //设置背景图高度
            height: ScreenUtil.instance.setHeight(220.0),
            //设置背景图宽度为屏幕宽度
            width: double.infinity,
            //背景图片
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/head_bg.png"),
                    //平铺填充模式
                    fit: BoxFit.cover
                ),
            ),
            //水平布局
            child: Row(
              children: <Widget>[
                //头像
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //圆形头像
                  child: ClipOval(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/head.jpeg',fit: BoxFit.cover,),
                    ),
                  ),
                ),
                //根据登录状态显示用户或登录注册
                this._isLogin ?
                  Expanded(
                    flex: 1,
                    child: Text(
                        _username,
                        style: TextStyle(color: Colors.white, fontSize: 26)),
                  ) :
                  Expanded(
                  flex: 1,
                  //点击跳转至登录页面
                  child: InkWell(
                    onTap: () {
                      RouterUtil.toLoginPage(context);
                    },
                    //登录或注册
                    child: Text(KString.LOGIN_OR_REGISTER, style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
          //全部订单
          ListTile(
            leading: Icon(Icons.assignment, color: Colors.blue),
            title: Text(KString.ALL_ORDER),
            //点击跳转到我的订单页面
            onTap: () {
              //判断是否登录
              if(_isLogin){
                RouterUtil.toOrderListPage(context);
              }else{
                MessageWidget.show(KString.PLEASE_LOGIN);
              }
            },
          ),
          Divider(),
          //我的收藏
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.redAccent),
            title: Text(KString.MY_COLLECT),
          ),
          Divider(),
          //我的优惠券
          ListTile(
            leading: Icon(Icons.attach_money, color: Colors.deepOrange),
            title: Text(KString.MY_COUPON),
          ),
          Divider(),
          Container(
              width: double.infinity,
              height: 10,
              color: Color.fromRGBO(242, 242, 242, 0.9)),
          //在线客服
          ListTile(
            leading: Icon(Icons.phone_in_talk, color: Colors.green),
            title: Text(KString.ONLINE_SERVICE),
          ),
          Divider(),
          //关于我们
          ListTile(
            leading: Icon(Icons.info, color: Colors.black54),
            title: Text(KString.ABOUT_US),
          ),
          Divider(),
          SizedBox(
            height: 30,
          ),
          //判断是否登录
          this._isLogin ?
          //退出登录按钮
          KBigButton(
            text:KString.LOGOUT_TITLE,
            //点击退出登录
            onPressed :(){
              //清理本地用户信息
              TokenUtil.clearUserInfo();
              //设置登录状态及用户名置空
              this.setState(() {
                _isLogin = false;
                _username = "";
              });
              //登录退出消息
              var data = {
                'username':'',
                'isLogin':false,
              };
              //派发退出登录消息
              Call.dispatch(Notify.LOGIN_STATUS, data: data);
          },):Container(),
        ],
      ),
    );
  }
}