//provider/user_info.dart文件
import 'package:flutter/material.dart';
import 'package:shop/model/user_model.dart';

//用户信息状态管理
class UserInfoProvider with ChangeNotifier {
  //用户数据模型
  UserModel userModel;

  //更新用户信息
  updateInfo(UserModel userModel) {
    this.userModel = userModel;
    //通知刷新数据
    notifyListeners();
  }
}
