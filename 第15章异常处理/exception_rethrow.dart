//exception_rethrow.dart文件
void main() {
  try {
    //虽然catch了异常,但是又rethrow了,所以要捕获
    test();
  } catch (e) {
    print('再次捕获到异常:' + e.toString());
  }
}

//抛出异常
void testException(){
  throw FormatException("这是一个异常");
}


void test() {
  try {
    testException();
  } catch (e) {
    //捕获到异常
    print('捕获到异常:' + e.toString());
    //重新抛出了异常
    rethrow;
  }
}