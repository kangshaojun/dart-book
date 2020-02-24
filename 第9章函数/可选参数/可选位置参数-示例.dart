void main() {
  //可行
  printUserInfo('张三');
  //可行
  printUserInfo('张三','中国',30);
  //不可行
  //printUserInfo('张三',30);
}
//from和age为可选位置参数
void printUserInfo(String name, [String from = '中国', int age]) {
  print(name + "来自" + from + "年龄" + age.toString());
}

