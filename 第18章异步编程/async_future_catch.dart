//async_future_catch.dart文件
import 'dart:async';

void main() {
  //then catch用法
  Future((){
    print("async task");
  }).then((res){
    print("async task complete");
  }).catchError((e){
    print(e);
  });
}