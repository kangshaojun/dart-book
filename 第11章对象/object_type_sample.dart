//object_type_sample.dart文件
void main(){
  //声明并实例化person对象
  Person person = Person();
  print("person.runtimeType:" + person.runtimeType.toString());
  //使用is判断是否为Person类
  if(person is Person){
    print("person对象的类型是:Person");
  }else{
    print("person对象的类型是:Animal");
  }
}
//人类Person
class Person{
}
//动物类
class Animal{
}

