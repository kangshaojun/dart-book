//stream_transform.dart文件
import 'dart:async';

void main(){
  //创建Stream,并测试转换方法
  testTransform();
}

void testTransform() async {
  //根据集合创建Stream
  var stream = Stream<int>.fromIterable([123456,322445,112233]);
  //由int转换成String类型
  var st = StreamTransformer<int, String>.fromHandlers(
    //数据回调方法
    handleData: (int data, sink) {
    if (data == 112233) {
      //添加提示数据
      sink.add("密码输入正确...");
    } else {
      //添加提示数据
      sink.add("密码输入错误...");
    }
  });
  //开始转换变监听数据流
  stream.transform(st).listen((String data) => print(data),onError: (error) => print("发生错误"));
}