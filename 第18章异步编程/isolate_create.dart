//isolate_create.dart文件
import 'dart:isolate';
import 'dart:io';

void main() {

  //主isolate启动
  print("main isolate start");

  //创建一个新的isolate
  create_isolate();

  //主isolate停止
  print("main isolate end");

}

//创建一个新的isolate
void create_isolate() async{

  //发送消息端口
  SendPort sendPort;

  //接收消息端口
  ReceivePort receivePort = ReceivePort();

  //创建一个新的isolate
  //传入要执行任务方法doWork
  //传入新isolate能够向主isolate发送的端口receivePort.sendPort
  Isolate newIsolate = await Isolate.spawn(doWork, receivePort.sendPort);


  //接收消息端口监听新isolate发送过来的消息
  receivePort.listen((message){

    //打印接收到的所有消息
    print("main isolate listen: $message");

    //消息类型为端口
    if (message['type'] == 'port'){
      //将新isolate发送过的端口赋值给senPort
      sendPort = message['data'];
    }else{
      //当sendPort对象实例化后可以向新isolate发送消息了
      //消息类型为message
      //消息数据为字符串
      sendPort?.send({
        'type':'message',
        'data':'main isolate message',
      });
    }
  });

}

//处理耗时任务 接收一个可以向主isolate发送消息的端口
void doWork(SendPort sendPort){

  //打印新isolate启动
  print("new isolate start");

  //接收消息端口
  ReceivePort receivePort = ReceivePort();

  //接收消息端口监听主isolate发送过来的消息
  receivePort.listen((message){
    print("new isolate listen:"+ message['data']);
  });

  //将新isolate的sendPort发送到主isolate中用于通信
  sendPort.send({
    'type':'port',
    'data':receivePort.sendPort,
  });

  // 模拟耗时5秒
  sleep(Duration(seconds:5));

  //发送消息表示任务结束
  sendPort.send({
    'type':'message',
    'data':'task finished',
  });

  //打印新isolate停止
  print("new isolate end");

}