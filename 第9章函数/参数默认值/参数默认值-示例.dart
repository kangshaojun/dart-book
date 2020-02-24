void main() {
  //只传入name
  printUserInfo('张三');
  //传入name及sex
  printUserInfo('小红','女');
  //传入name sex age
  printUserInfo('小红','女',26);
}

//参数sex为默认参数 当不传入sex参数时默认值为'男'
void printUserInfo(String name,[String sex='男',int age]){
  //age不传值时为null
  if(age!=null){
    print("姓名:$name 性别:$sex 年龄:$age");
  }
  print("姓名:$name 性别:$sex 年龄保密");
}