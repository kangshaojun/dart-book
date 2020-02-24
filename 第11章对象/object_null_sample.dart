//object_null_sample.dart文件
void main(){
  //声明person对象
  Person person = null;
  //实例化person对象
  person = Person();
  //判断对象是否为null
  if(person != null){
    //调用成员方法
    person.run();
  }
}
//类名为Person 继承Object
class Person extends Object {
  //成员变量
  String sex = "男";
  //成员方法
  String run(){
    return "人类会跑步";
  }
}

//void main(){
//  //声明person对象
//  Person person = null;
//  //不实例化直接调用
//  person.run();
//}
////类名为Person 继承Object
//class Person extends Object {
//  //成员变量
//  String sex = "男";
//  //成员方法
//  String run(){
//    return "人类会跑步";
//  }
//}
