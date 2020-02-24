//exception_throw.dart文件
void main(){
  //调用函数 抛出异常
  testException1();
  //testException2();
  //testException3();
}

//抛出异常测试
void testException1(){
  //抛出一个异常
  throw "这是第一个异常";
}

//抛出异常测试
void testException2(){
  //抛出一个异常
  throw Exception("这是第二个异常");
}

//抛出异常测试
void testException3() => throw Exception("这是第三个异常");