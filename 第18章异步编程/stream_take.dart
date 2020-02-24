//stream_take.dart文件
import 'dart:async';

void main(){
  //创建Stream
  createStream();
}

void createStream() async{
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  //指定发送事件个数
  stream = stream.take(10);
  //输出Stream
  await for(int i in stream ){
    print(i);
  }
}