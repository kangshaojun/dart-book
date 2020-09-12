//service/http_service.dart文件
import 'dart:convert';
import 'dart:io';
import 'package:flutter_shop/utils/token_util.dart';
//网络请求服务
class HttpService {
  //http get请求
  //url 请求地址
  //param 请求参数
  static Future<Map<String, dynamic>> get(String url, {Map<String, dynamic> param}) async {
    //如果没有?号添加?号
    if(url.indexOf('?') < 0 ){
      url += '?';
    }
    //读取参数并组成带参数的url
    if(param != null) {
      param.forEach((key, value) {
        url += (key + '=' + value.toString() + '&');
      });
    }
    //截取字符串
    url  = url.substring(0, url.length - 1 );
    //定义Http客户端
    HttpClient httpClient;
    //定义Http客户端请求对象
    HttpClientRequest request;
    //定义Http客户端返回对象
    HttpClientResponse response;
    try {
      //实例化Http客户端
      httpClient = HttpClient();
      //获取请求对象
      request = await httpClient.getUrl(Uri.parse(url));
      //设置请求头
      await setHeader(request);
      //发起请求并返回对象
      response = await request.close();
      //解析出body内容
      String body = await response.transform(utf8.decoder).join();
      //当返回状态为200时表示请求成功
      if (response.statusCode == 200) {
        //Json解码后生成Map对象并返回
        Map<String, dynamic> resBody = json.decode(body);
        return resBody;
      }else{
        print('请求失败...');
      }
    } finally {
      //关闭请求对象
      if(request != null)
        request.close();
      //关闭HttpClient对象
      if(httpClient != null)
        httpClient.close();
    }
    return null;
  }

  //http post请求
  //url 请求地址
  //param 请求参数
  static Future<Map<String, dynamic>> post(String url, {Map<String, dynamic> param}) async {
    //定义Http客户端
    HttpClient httpClient;
    //定义Http客户端请求对象
    HttpClientRequest request;
    //定义Http客户端返回对象
    HttpClientResponse response;
    try {
      //实例化Http客户端
      httpClient = HttpClient();
      //获取请求对象
      request = await httpClient.postUrl(Uri.parse(url));
      //设置请求头
      await setHeader(request);
      //参数编码后添加至请求对象里
      if(param != null) {
        request.add(utf8.encode(json.encode(param)));
      }
      //发起请求并返回对象
      response = await request.close();
      //解析出body内容
      String body = await response.transform(utf8.decoder).join();
      //当返回状态为200时表示请求成功
      if (response.statusCode == 200) {
        Map<String, dynamic> resBody = json.decode(body);
        return resBody;
      }else{
        print('请求失败...');
      }

    }finally {
      //关闭请求对象
      if(request != null)
        request.close();
      //关闭HttpClient对象
      if(httpClient != null)
        httpClient.close();
    }
    return null;
  }

  //设置请求头
  static void setHeader(HttpClientRequest request) async{
   //'application/x-www-form-urlencoded; charset=UTF-8'
   //'application/json; charset=UTF-8'
   request.headers.set(HttpHeaders.contentTypeHeader, 'application/json; charset=UTF-8');
   //获取token值
   String token = await TokenUtil.getToken();
   //设置请求头
   request.headers.set('Authorization',token);
  }

}