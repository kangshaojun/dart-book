//stream_create_from_iterable.dart文件
import 'dart:async';

void main(){
  //从一个集合创建Stream
  createStream();
}

createStream() async{
  print("开始测试");
  //从集合创建Stream
  Stream<int> stream = Stream<int>.fromIterable([1,2,3,4,5,6]);
  //读取Stream
  await for(var s in stream){
    print(s);
  }
  print("结束测试");
}