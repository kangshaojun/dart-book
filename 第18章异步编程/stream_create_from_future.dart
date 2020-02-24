//stream_create_from_future.dart文件
import 'dart:async';

void main(){
  //创建一个Stream
  createStream();
}

createStream() async{
  print("开始测试");
  //创建一个Future对象
  Future<String> future = Future((){
    return "异步任务";
  });

  //从Future创建Stream
  Stream<String> stream = Stream<String>.fromFuture(future);
  //await for循环从流中读取
  await for(var s in stream){
    print(s);
  }
  print("结束测试");
}