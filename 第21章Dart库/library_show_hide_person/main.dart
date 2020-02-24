//library_show_hide_main.dart文件
//可以使用Student和Person类
import 'person.dart' show Student, Person;
//不能使用Person类
//import 'person.dart' hide Person;

void main(List<String> args) {

  //使用Person类
  Person person = Person('张三', 20);
  person.printInfo();

  //使用Student类
  Student student = Student('李四', 20);
  student.printInfo();
  student.study();

}
