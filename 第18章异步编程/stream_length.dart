//stream_length.dart文件
import 'dart:async';

void main(){
  //创建Stream,并统计事件的总数量
  testStreamLength();
}

void testStreamLength() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  stream = stream.take(5);
  //统计事件的总数量
  var allEvents = await stream.length;
  print(allEvents);
}