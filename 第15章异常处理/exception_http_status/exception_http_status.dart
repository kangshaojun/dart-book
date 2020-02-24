//exception_http_status.dart
import 'dart:async';
import 'package:http/http.dart' as http;

void main(){
  //发起Http请求
  httpRequest();
}

//发起Http请求 异步处理
Future httpRequest()async{
  //try-catch捕获异常
  try{
    //请求后台url路径
    var url = 'http://127.0.0.1:3000/httpException';
    //向后台发起get请求 response为返回对象
    http.get(url).then((response) {
      print("服务端返回状态： ${response.statusCode}");
      //判断返回状态
      if(response.statusCode == 200){
        //返回response对象
        return response;
      }else if(response.statusCode == 404){
        //抛出异常
        throw StatusException(type: StatusType.STATUS_404,msg:'找不到页面');
      } else if(response.statusCode == 500){
        //抛出异常
        throw StatusException(type: StatusType.STATUS_500,msg:'服务器内部发生错误');
      }else{
        //抛出异常
        throw StatusException(type: StatusType.DEFAULT,msg:'Http请求异常');
      }
    });
  }catch(e){
    //打印错误
    return print('error:::${e}');
  }
}

//状态类型
enum StatusType {
  //默认状态
  DEFAULT,
  //找不到页面状态
  STATUS_404,
  //服务器内部错误状态
  STATUS_500,
}

//自定义状态异常
class StatusException implements Exception {
  //构造方法 传入状态类型及异常信息
  StatusException({
    this.type = StatusType.DEFAULT,
    this.msg,
  });

  //枚举值状态类型
  StatusType type;
  //异常信息
  String msg;

  //输出异常信息
  String toString() {
    return msg ?? "Http请求异常";
  }
}