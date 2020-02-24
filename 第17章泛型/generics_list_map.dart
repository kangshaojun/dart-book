//generics_list_map.dart文件
void main(){

  //元素为String类型
  var names = <String>['张三', '李四', '王五'];
  print(names);
  //Key和Value均为String类型
  var users = <String, String>{
    '0000001': '张三',
    '0000002': '李四',
    '0000003': '王五'
  };
  print(users);

  //Key为String类型,Value为User类型
  var userMap = <String,User>{
    'alex':User('alex',20),
    'kevin':User('kevin',30),
    'jennifer':User('jennifer',30),
  };
  //直接打印输出
  print(userMap);
  //输出Map集合的Key和Value值
  userMap.forEach((String key,User value){
    print('Key = ' + key);
    print("Value = " + "name:" +  value.name + " age:" + value.age.toString());
  });
  
}

//用户类
class User{
  //用户姓名
  String name;
  //用户年龄
  int age;
  //构造方法
  User(this.name,this.age);
}
