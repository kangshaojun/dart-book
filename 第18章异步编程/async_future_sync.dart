//async_future_sync.dart文件
import 'dart:async';

void main() {
  print("main start");

  //立即执行
  Future.sync((){
    print("sync task");
  });

  //最后执行
  Future((){
    print("async task");
  });

  print("main stop");
}
