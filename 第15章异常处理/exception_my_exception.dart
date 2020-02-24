//exception_my_exception.dart文件
void main(){
  //测试自定义异常
  try{
    testMyException();
  } catch(e){
    print(e.toString());
  }
}

//抛出异常测试
void testMyException(){
  //抛出一个异常
  throw MyException('这是一个自定义异常');
}

//实现Exception接口自定义一个异常
class MyException implements Exception {

  //异常信息属性
  final String msg;

  //构建方法 传入可选参数msg
  MyException([this.msg]);

  //重写toString方法 输出异常信息
  @override
  String toString() => msg ?? 'MyException';
}