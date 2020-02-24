//stream_as_broadcast.dart文件
import 'dart:async';

void main(){
  //实例化StreamController对象
  StreamController<String> streamController = StreamController();
  //将单订阅流转换成多订阅流
  Stream stream =streamController.stream.asBroadcastStream();
  //添加第一次监听
  stream.listen((data){
    print('第一次的监听数据:'+ data);
  });
  //添加第二次监听
  stream.listen((data){
    print('第二次的监听数据:'+ data);
  });
  streamController.sink.add("Dart...");
  //关闭流
  streamController.close();
}