//async_future_then.dart文件
import 'dart:async';

void main() {
  print("main start");

  Future fu = Future.value('Future的值为30');
  // 使用then注册回调
  fu.then((res){
    print(res);
  });

  //链式调用,可以跟多个then,注册多个回调
  Future((){
    print("async task");
  }).then((res){
    print("async task complete");
  }).then((res){
    print("async task after");
  });

  print("main stop");
}