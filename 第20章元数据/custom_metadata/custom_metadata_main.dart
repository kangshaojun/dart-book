//custom_metadata_main.dart文件
import 'todo.dart';

void main() {

  //实例化Test对象
  Test test = Test();
  test.doSomething();

}

//测试类
class Test{

  //使用Todo元数据
  @Todo('kevin', 'make this do something')
  void doSomething() {
    print('do something');
  }

}
