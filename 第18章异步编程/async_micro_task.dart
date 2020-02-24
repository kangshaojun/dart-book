//async_micro_task.dart文件
import  'dart:async';

void  main() {
  //使用scheduleMicrotask方法添加
  scheduleMicrotask(myTask);

  //使用Future对象添加
  Future.microtask(myTask);
}

void myTask(){
  print("这是一个任务");
}