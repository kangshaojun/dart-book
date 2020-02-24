//object_constructor_factory.dart文件
void main(){
  Logger logger = Logger('Dart');
  logger.log('调用工厂构造方法');
}
//日志类
class Logger {
  //日志名称
  final String name;

  //日志缓存_cache用于存储Logger对象
  static final Map<String, Logger> _cache = <String, Logger>{};

  //工厂构造方法
  factory Logger(String name) {
    //向缓存里添加一个Map
    return _cache.putIfAbsent(
        //key为name value为Logger对象
        name, () => Logger._internal(name));
  }

  //命名构造方法 用于创建一个Logger对象
  Logger._internal(this.name);

  //输出日志
  void log(String msg) {
    print(msg);
  }
}
