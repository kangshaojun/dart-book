//isolate_compute.dart文件
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() {

  //主isolate启动
  print("main isolate start");

  //创建一个新的isolate
  create_new_task();

  //主isolate停止
  print("main isolate end");

}

// 创建一个新的耗时任务
create_new_task() async{
  var str = "new task finished";
  var result = await compute(doWork, str);
  print(result);
}

//开始执行
String doWork(String value){

  print("new isolate start");

  // 模拟耗时5秒
  sleep(Duration(seconds:5));

  print("new isolate end");
  return "complete:$value";
}