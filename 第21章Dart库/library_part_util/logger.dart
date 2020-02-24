//library_part_logger.dart文件
//日志工具为util库的一部分
part of util;

//日志类
class Logger {

  //应用名称
  String _app_name;

  //构造方法
  Logger(this._app_name){}

  //错误
  void error(error) {
    print('[' + _app_name + '] ERROR: ' + error);
  }

  //调试
  void debug(msg) {
    print('[' + _app_name + '] DEBUG: ' + msg);
  }

  //警告
  void warn(msg) {
    print('[' + _app_name + '] WARN: ' + msg);
  }

  //失败
  void failure(error) {
    var log = '[' + _app_name + '] FAILURE: ' + error;
    print(log);
    throw (log);
  }
}