//stream_take_while.dart文件
import 'dart:async';

void main(){
  //创建Stream
  createStream();
}

void createStream() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  //根据返回结果做返回值的限制
  stream = stream.takeWhile((data) {
    //返回值的限制条件
    return data < 8;
  });
  //输出Stream
  await for (int i in stream) {
    print(i);
  }
}