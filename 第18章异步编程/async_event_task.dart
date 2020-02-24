//async_event_task.dart文件
import  'dart:async';

void myTask(){
  print("这是一个任务");
}

void main() {
  //将任务传入Future构造方法里即可
  Future(myTask);
}