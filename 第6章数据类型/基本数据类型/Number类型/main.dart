void main() {
  int r = 255;//颜色R G B的R值
  int color = 0xFFFFFFFF;//颜色值

  //字符串转换成整型 String ==> int
  var valueInt = int.parse('10');
  assert(valueInt == 10);

  //字符串转换成符点型 String ==> double
  var valueDouble = double.parse('10.10');
  assert(valueDouble == 10.10);

  //整型转换成字符串 int ==> String
  String valueString = 10.toString();
  assert(valueString == '10');

  //符点型转换成字符串 double ==> String 保留两位小数
  String pi = 3.1415926.toStringAsFixed(2);
  assert(pi == '3.14');
}
