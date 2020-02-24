//stream_listen.dart文件
import 'dart:async';

void main(){
  //创建Stream,使用list方法监听流
  testListen();
}

void testListen() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  stream = stream.take(10);
  //监听流
  stream.listen((data){
    print(data);
  },onError:(error){
    print("流发生错误");
  },onDone:(){
    print("流已完成");
  }, cancelOnError: false);
}