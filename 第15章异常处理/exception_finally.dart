//exception_finally.dart文件
void main() {
  try{
    //调用方法
    testException();
    //e是异常对象 r是StackTrace对象 异常的堆栈信息
  } catch(e, r){
    //输出异常信息
    print(e.toString());
  } finally {
    print('释放资源');
  }
}

//抛出异常
void testException(){
  throw FormatException("这是一个异常");
}