//call/call.dart文件
//消息派发和监听工具
class Call {

  //定义Map Key为消息类型 Value为对应的回调方法
  static Map<String, List<Function>> _callMap = Map<String, List<Function>>();

  //添加消息回调方法 传入消息类型和回调函数
  static Future<void> addCallBack(String type, Function callback) async {
    if(_callMap[type] == null ) {
      _callMap[type] = [];
    }
    if(await hasCallBack(type, callback) == false) {
      _callMap[type].add(callback);
    }
  }

  //判断是否有此回调
  static Future<bool> hasCallBack(type,Function callBack) async {
    if(_callMap[type] == null ) {
      return false;
    }
    return _callMap[type].contains(callBack);
  }

  //移除回调
  static Future<void> removeCallBack(type,Function callBack) async {
    if(_callMap[type] == null ) {
      return;
    }
    _callMap[type].removeWhere((element) => element == callBack);
  }

  //派发消息并执行回调函数
  static Future<void> dispatch(String type, {dynamic data = null }) async {
    if(_callMap[type] == null) {
      throw Exception('回调事件 $type 没有监听，发送失败');
    }
    _callMap[type].forEach((element) {
      element(data);
    });
  }

}