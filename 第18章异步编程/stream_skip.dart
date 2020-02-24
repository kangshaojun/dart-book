//stream_skip.dart文件
import 'dart:async';

void main(){
  //创建Stream,跳过指定个数元素
  testSkip();
}

void testSkip() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  //指定发送事件次数
  stream = stream.take(10);
  //跳过前两个元素
  stream = stream.skip(2);
  //输出Stream
  await for (int i in stream) {
    print(i);
  }
}
