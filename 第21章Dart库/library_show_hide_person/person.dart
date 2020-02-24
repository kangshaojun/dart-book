//library_show_hide_person.dart文件
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
    print("Person:${this.name} ${this.age}");
  }

}

//定义Student类
class Student{

  //姓名变量
  String name;

  //年龄变量
  int age;

  //构造方法
  Student(this.name,this.age);

  //打印信息方法
  void printInfo(){
    print("Student:${this.name} ${this.age}");
  }

  //学习方法
  void study(){
    print('Student:study');
  }

}