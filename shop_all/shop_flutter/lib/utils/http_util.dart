//utils/http_util.dart文件
import 'package:dio/dio.dart';
import 'package:shop/config/index.dart';
import 'package:shop/utils/shared_preferences_util.dart';
//定义dio变量
var dio;
//Http请求处理工具,提供了Get及Post请求封装方法
class HttpUtil {
  //获取HttpUtil实例
  static HttpUtil get instance => _getInstance();
  //定义HttpUtil实例
  static HttpUtil _httpUtil;
  //获取HttpUtil实例方法,工厂模式
  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }
  //构造方法
  HttpUtil() {
    //选项
    BaseOptions options = BaseOptions(
      //连接超时
      connectTimeout: 5000,
      //接收超时
      receiveTimeout: 5000,
    );
    //实例化Dio
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("========================请求数据===================");
      print("url=${options.uri.toString()}");
      print("params=${options.data}");
      //锁住
      dio.lock();
      //获取本地token
     await SharedPreferencesUtil.getToken().then((token) {
       //将token值放入请求头里
        options.headers[KString.TOKEN] = token;
      });
     //解锁
      dio.unlock();
      return options;
    }, onResponse: (Response response) {
      print("========================请求数据===================");
      print("code=${response.statusCode}");
      print("response=${response.data}");
    }, onError: (DioError error) {
      print("========================请求错误===================");
      print("message =${error.message}");
    }));
  }

  //封装get请求
  Future get(String url, {Map<String, dynamic> parameters, Options options}) async {
    //返回对象
    Response response;
    //判断请求参数并发起get请求
    if (parameters != null && options != null) {
      response = await dio.get(url, queryParameters: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.get(url, queryParameters: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.get(url, options: options);
    } else {
      response = await dio.get(url);
    }
    //返回数据
    return response.data;
  }

  //封装post请求
  Future post(String url, {Map<String, dynamic> parameters, Options options}) async {
    //返回对象
    Response response;
    //判断请求参数并发起post请求
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    //返回数据
    return response.data;
  }
}
