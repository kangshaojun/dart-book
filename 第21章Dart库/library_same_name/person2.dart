//library_same_name_person2.dart文件
//定义Person类
class Person{

  //姓名变量
  String name;

  //年龄变量
  int age;

  //构造方法
  Person(this.name,this.age);

  //打印信息方法
  void printInfo(){
    print("${this.name} ${this.age}");
  }

}