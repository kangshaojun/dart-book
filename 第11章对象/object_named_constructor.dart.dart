//object_named_constructor.dart文件
void main(){
  //调用Person的命名构造方法
  Person p = Person.run();
}

class Person{
  //姓名
  String name;
  //年龄
  int age;
  //默认构造方法
  Person(this.name,this.age);
  //命名构造方法
  Person.run(){
    print('命名构造方法');
  }
}