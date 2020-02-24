//library_local_main.dart文件
//导入person.dart文件
import './person.dart';

void main(){
  //使用库里的Person类
  Person person = Person('张三', 20);
  person.printInfo();
}
