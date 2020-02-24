//async_delayed.dart文件
import  'dart:async';
import  'dart:io';

void  main() {
  print("main start");

  //延迟1秒后执行任务
  Future.delayed(Duration(seconds:1),(){
    print('延迟任务');
  });

  Future((){
    //模拟耗时5秒
    sleep(Duration(seconds:5));
    print("耗时5秒");
  });

  print("main stop");
}