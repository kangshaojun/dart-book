//object_constructor_student.dart文件
//父类
class Person {
  //姓名
  String name;
  //年龄
  int age;
  //构造方法
  Person.fromJson(Map data) {
    print('Person construct...');
  }
}
//子类
class Student extends Person {
  //Person没有默认构造方法 必须调用super.fromJson(data)
  Student.fromJson(Map data) : super.fromJson(data) {
    print('Student construct...');
  }
}

main() {
  var student = Student.fromJson({});
}
