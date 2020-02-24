//extends_override_noSuchMethod.dart文件
void main() {
  //实例化Person类
  dynamic person = Person();
  //调用一个不存在的方法
  print(person.setUserInfo('20', '张三'));
  //调用一个存在的方法
  person.someMethod();

}

class Person extends Object{

  //可调用的方法
  void someMethod(){
    print('调用此方法:someMethod');
  }

  //重写noSuchMethod
  @override
  noSuchMethod(Invocation invocation) => '找不到此方法: 方法名: ${invocation.memberName} 参数: ${invocation.positionalArguments}';

}