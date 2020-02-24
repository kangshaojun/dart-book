//stream_broadcast.dart文件
import 'dart:async';

void main(){
  //使用StreamController的broadcast方法可以直接创建多订阅流
  StreamController<String> streamController = StreamController.broadcast();
  //第一个监听
  streamController.stream.listen((data){
    print('第一次的监听数据:'+ data);
  },onError: (error){
    print(error.toString());
  });
  //第一个监听
  streamController.stream.listen((data){
      print('第二次的监听数据:'+ data);
  });
  //添加数据
  streamController.add("Dart...");
}