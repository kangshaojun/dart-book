//作用域在整个dart文件代码内
String data = '测试数据';

void main() {
  //请求serverUrl 作用域在main函数内
  String serverUrl = 'http://127.0.0.1/getData';
  getServerData(serverUrl);
}

//获取服务器数据函数
void getServerData(String url) {
  //请求参数 作用域在getServerData函数内
  var formData = {'id': '001'};
  //发起请求
  request(url,formData,(int statusCode){
    if(statusCode == 200){
      //此处不能读取serverUrl变量
      print('请求地址为:' + url);
      //此处可以读取formData变量
      print('请求参数为:' + formData['id']);
      //此处可以读取data变量
      print('成功返回数据为:' + data);
    }
  });
}

//发起请求
void request(String url,formData,Function callBack){
  print('发起http请求');
  callBack(200);
}