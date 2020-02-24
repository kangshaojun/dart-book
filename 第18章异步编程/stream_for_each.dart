//stream_for_each.dart文件
import 'dart:async';

void main(){
  //创建Stream,使用Stream的forEach迭代输出数据
  testForEach();
}

void testForEach() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  stream = stream.take(5);
  //Stream迭代输出数据
  stream.forEach((data) {
    print(data);
  });
}