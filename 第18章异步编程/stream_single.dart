//stream_single.dart文件
import 'dart:async';

void main(){
  //StreamController里面会创建一个Stream,我们实际操控的Stream
  StreamController<String> streamController = StreamController();
  //监听流数据
  streamController.stream.listen((data)=> print(data));
  //添加数据
  streamController.sink.add("aaa");
  //添加数据
  streamController.add("bbb");
  //添加数据
  streamController.add("ccc");
  //关闭流
  streamController.close();
}