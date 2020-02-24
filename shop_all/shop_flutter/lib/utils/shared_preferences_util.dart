//utils/shared_preferences_util.dart文件
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/config/index.dart';
//本地存储工具
class SharedPreferencesUtil {
  //token字符串
  static String token = "";
  //获取token值
  static Future getToken() async {
    if (token == null || token.isEmpty) {
      //从本地取出token值
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      token = sharedPreferences.getString(KString.TOKEN) ?? null;
    }
    return token;
  }
  //获取头像url
  static Future getImageHead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(KString.HEAD_URL);
  }
  //获取呢称
  static Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(KString.NICK_NAME);
  }
}
