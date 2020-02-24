//stream_bloc_counter.dart文件
import 'dart:async';
import 'bloc_base.dart';

//继承BlocBase
class BlocCounter extends BlocBase {

  //初例化StreamController,数据类型为int
  final _controller = StreamController<int>();

  //获取到StreamController的sink,即入口可以添加数据
  get _counter => _controller.sink;

  //获取到StreamController的stream,即出口可以取数据
  get counter => _controller.stream;

  //增加计算器值
  void increment(int count) {
    //向流中添加数据
    _counter.add(++count);
  }

  //销毁
  void dispose() {
    //关闭流
    _controller.close();
  }
}