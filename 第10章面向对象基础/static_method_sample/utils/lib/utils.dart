//static_method_sample/utils/lib/utils.dart文件
import 'dart:io';
//工具类
class Utils{
  //静态方法 判断当前运行的平台是否为移动设备
  static bool isMobile() {
    //使用Platform判断平台类型
    return Platform.isAndroid || Platform.isIOS;
  }
}