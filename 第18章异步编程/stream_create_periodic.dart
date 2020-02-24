//stream_create_periodic.dart文件
import 'dart:async';

void main(){
  //创建Stream
  createStream();
}

createStream() async{
  //使用periodic创建流,第一个参数为间隔时间,第二个参数为回调函数
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), callBack);
  //await for循环从流中读取
  await for(var i in stream){
    print(i);
  }
}

//可以在回调函数中对值进行处理,这里直接返回了
int callBack(int value){
  return value;
}

