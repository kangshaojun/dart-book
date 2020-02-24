//async_future_static_wait.dart文件
import 'dart:async';

void main() {
  print("main start");

  //任务一
  Future task1 = Future((){
    print("task 1");
    return 1;
  });

  //任务二
  Future task2 = Future((){
    print("task 2");
    return 2;
  });

  //任务三
  Future task3 = Future((){
    print("task 3");
    return 3;
  });

  //使用wait方法等待三个任务完成后回调
  Future future = Future.wait([task1, task2, task3]);
  future.then((responses){
    print(responses);
  });

  print("main stop");
}