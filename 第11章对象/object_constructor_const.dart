//object_constructor_const.dart文件
void main(){
  //获取ImmutablePerson实例
  ImmutablePerson p = ImmutablePerson.instance;
  print('name:' + p.name);
  print('age:' + p.age.toString());
}

class ImmutablePerson {
  //静态常量
  static final ImmutablePerson instance = const ImmutablePerson('张三', 20);
  //姓名
  final String name;
  //年龄
  final int age;
  //构造方法
  const ImmutablePerson(this.name, this.age);
}
