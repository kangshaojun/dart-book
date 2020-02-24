//event/login_event.dart文件
import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();
//登录事件
class LoginEvent {
  //是否登录
  bool isLogin;
  //昵称
  String nickName;
  //头像url
  String url;
  //构造方法
  LoginEvent(this.isLogin, {this.nickName, this.url});
}
