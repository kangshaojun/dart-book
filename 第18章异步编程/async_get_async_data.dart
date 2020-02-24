//async_get_async_data.dart文件
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';

void main(){
  //网络请求参数
  var params = {'id':'000001'};
  //调用网络请求方法
  Future future = getAsyncData('http://192.168.2.168:3000/getAsyncData',params: params);
  //使用Future的then方法取得返回数据
  future.then((value){
    //value即为服务端返回数据
    print(value);
  });

}

//方法后面添加async表示异步方法 返回值为Future
Future getAsyncData(url,{params}) async {

  //添加try...catch捕获网络请求异常
  try{
    //返回对象
    Response response;
    //实例化Dio对象
    Dio dio = Dio();
    //设置Post请求编码格式为application/x-www-form-urlencoded
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    //使用dio发起post请求,使用await关键等待返回结果
    if(params == null){
      response = await dio.post(url);
    }else{
      response = await dio.post(url,data: params);
    }
    //当返回状态为200时,表示请求正常返回
    if(response.statusCode == 200){
      //返回response对象
      return response;
    }else{
      throw Exception('Server exception...');
    }
  }catch(e){
    return print('error:::${e}');
  }
}