//utils/token_util.dart文件
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_shop/model/user_model.dart';
//Token及登录信息处理工具
class TokenUtil{

  //判断是否登录
  static Future<bool> isLogin() async{
    String token = "";
    //读取本地存储数据
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token');
    //如果查不到token返回false否则返回true
    if(token == "" || token == null){
      return false;
    }
    return true;
  }

  //返回Token
  static Future<String> getToken() async{
    //读取本地存储数据
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取token值
    String token = await prefs.getString('token');
    return token;
  }

  //存储登录信息
  static saveLoginInfo(UserModel userModel) async{
    //创建本地存储对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //设置token值
    await prefs.setString('token',userModel.token);
    //设置用户名
    await prefs.setString('username',userModel.username);
    //设置用户Id
    await prefs.setInt('id',userModel.id);
    //设置用户头像
    await prefs.setString('head_image',userModel.head_image);
    //设置手机号
    await prefs.setString('mobile',userModel.mobile);
    //设置地址
    await prefs.setString('address',userModel.address);
  }

  //退出登录使用
  static clearUserInfo() async{
    //创建本地存储对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //token置为空
    await prefs.setString('token','');
    //用户名置为空
    await prefs.setString('username','');
    //用户Id置为0
    await prefs.setInt('id',0);
    //用户头像置为空
    await prefs.setString('head_image','');
    //手机号置为空
    await prefs.setString('mobile','');
    //地址置为空
    await prefs.setString('address','');
  }

  //获取用户信息
  static Future<Map<String,dynamic>> getUserInfo() async{
    //创建本地存储对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取用户名
    String username = await prefs.getString('username');
    //获取用户Id
    int id =  await prefs.getInt('id');
    //获取手机号
    String mobile =  await prefs.getString('mobile');
    //获取地址
    String address =  await prefs.getString('address');

    //返回用户信息
    return {
      'username': username,
      'id':id,
      'mobile':mobile,
      'address':address,
    };
  }

}