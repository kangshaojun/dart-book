//metadata_deprecated.dart文件
void main(){
  //实例化手机类
  Mobile mobile = Mobile();
  //2G网络很慢,不推荐使用此网络
  mobile.netWork2G();
  mobile.netWork3G();
  mobile.netWork4G();
  mobile.netWork5G();
}

//定义手机类
class Mobile {

  //被弃用的方法,也可用不推荐使用
  @deprecated
  void netWork2G(){
    print('手机使用2G网络');
  }

  //推荐使用的方法
  void netWork3G(){
    print('手机使用3G网络');
  }

  //推荐使用的方法
  void netWork4G(){
    print('手机使用4G网络');
  }

  //推荐使用的方法
  void netWork5G(){
    print('手机使用5G网络');
  }

}