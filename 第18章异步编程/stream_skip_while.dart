//stream_skip_while.dart文件
import 'dart:async';

void main(){
  //创建Stream,按条件跳过元素
  testSkipWhile();
}

void testSkipWhile() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  //指定发送事件个数
  stream = stream.take(10);
  //根据条件跳过元素,条件为返回值小于5
  stream = stream.skipWhile((data) => data<5);
  //输出Stream
  await for (int i in stream) {
    print(i);
  }
}