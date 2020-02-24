void main() {
  //字符串
//  var s1 = 'hello world'; //单双引
//  var s2 = "hello world"; //双引号

  //加号+使用
//  var s1 = 'hi ';
//  var s2 = 'flutter';
//  var s3 = s1 + s2;
//  print(s3);

  //大块文本表示
//  var s1 = '''
//  请注意这是一个用三个单引号包裹起来的字符串，
//  可以用来添加多行数据。
//  ''';
//
//  var s2 = """同样这也是一个用多行数据，
//  只不过是用双引号包裹起来的。
//  """;

  //转义字符
//  var s = "\n这是第一行文本\n这是第二行文本\n这是第三行文本\t一个TAB位置";
//  print(s);

  //去掉转义字符
//  var rs = r"\n这是第一行文本\n这是第二行文本\n这是第三行文本\t一个TAB位置";
//  print(rs);


  String name = '张三';
  int age = 30;
  //插入变量 可以不用{}
  String s1 = '张三的年龄是$age';
  print(s1);

  int score = 90;
  //插入表达式 必需加入{}
  String s2 = '成绩${score >= 60 ? '及格' : '不及格'}';
  print(s2);


  //可作为常量字符串的组成部分
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = '常量字符串';

  //不可作为常量字符串的组成部分
  var aNum = 0;
  var aBool = true;
  var aString = '一个字符串变量';
  const aConstList = [1, 2, 3];

  //插值为常量可以组成字符串常量
  const validConstString = '$aConstNum $aConstBool $aConstString';
  //插值为变量不可以组成字符串常量
  //const invalidConstString = '$aNum $aBool $aString $aConstList';
}
