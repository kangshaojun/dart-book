//generics_class.dart文件

void main() {
  
  Log logInt = Log<int>();
  logInt.add(12);
  logInt.add(23);
  //输出int型数据
  logInt.printLog();

  Log logString = Log<String>();
  logString.add('这是一条日志');
  logString.add('泛型类型为String');
  //输出String类型数据
  logString.printLog();

}

//日志类 类型为T
class Log<T>{

  //定义一个列表用来存储日志
  List list = List<T>();

  //添加数据
  void add(T value){
    //添加日志到列表里
    this.list.add(value);
  }

  //打印日志
  void printLog(){
    //循环输出日志数据
    for(var i=0; i<this.list.length; i++){
      print(this.list[i]);
    }

  }
}
