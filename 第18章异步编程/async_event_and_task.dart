//async_event_and_task.dart文件
import  'dart:async';

//测试程序执行过程
void  main() {
  print("main start");

  //放入事件队列
  Future((){
    print("这是一个任务:EventTask");
  });

  //放入MicroTask
  Future.microtask((){
    print("这是一个任务:MicroTask");
  });

  print("main stop");
}
