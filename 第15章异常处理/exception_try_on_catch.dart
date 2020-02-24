//exception_try_on_catch.dart文件
//抛出没有类型的异常
void testNoTypeException(){
  throw "这是一个没有类型的异常";
}

//抛出Exception类型的异常
void testException(){
  throw Exception("这是一个Exception类型的异常");
}

//抛出FormatException类型的异常
void testFormatException(){
  throw FormatException("这是一个FormatException类型的异常");
}

void main() {
  try{
    testNoTypeException();
   //testException();
   //testFormatException();
  } on FormatException catch(e){ //如果匹配不到FormatException 则会继续匹配
    print(e.toString());
  } on Exception catch(e){ //匹配不到Exception，会继续匹配
    print(e.toString()) ;
  }catch(e, r){ //匹配所有类型的异常 e是异常对象 r是StackTrace对象 异常的堆栈信息
    print(e);
  }
}

