//stream_to_list.dart文件
import 'dart:async';

void main(){
  //创建Stream,将流中的数据放在List里
  testToList();
}

void testToList() async {
  //时间间隔为1秒
  Duration interval = Duration(seconds: 1);
  //每隔1秒发送1次的事件流
  Stream<int> stream = Stream.periodic(interval, (data) => data);
  //指定发送事件个数
  stream = stream.take(10);
  //将流中所有的数据收集存放在List中
  List<int> listData = await stream.toList();
  //输出List数据
  for(int i in listData){
    print(i);
  }
}