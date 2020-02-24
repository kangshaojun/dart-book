//async_async_wait.dart文件
import 'dart:io';

//模拟耗时操作,调用sleep方法睡眠2秒
doTask() async{
  //等待其执行完成,耗时2秒
  await sleep(const Duration(seconds:2));
  return "执行了耗时操作";
}

//定义一个方法用于包装
test() async {
  //添加await关键字,等待异步处理
  var r = await doTask();
  //必需等待await关键字后面的方法doTask执行完成,才执行下一行代码
  print(r);
}

void main(){
  print("main start");
  test();
  print("main end");
}
