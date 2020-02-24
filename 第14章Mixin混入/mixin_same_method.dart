//mixin_same_method.dart文件
//类A
class A {

  //同名方法A
  String getMessage() => 'A';

}

//类B
class B {

  //同名方法 返回B
  String getMessage() => 'B';

}

//类P
class P {

  //同名方法 返回P
  String getMessage() => 'P';

}

//类AB 继承P 先混入A类后混入B类
class AB extends P with A, B {

}

//类BA 继承P 先混入B类后混入A类
class BA extends P with B, A {

}

void main() {
  //返回结果
  String result = '';
  //实例化AB类
  AB ab = AB();
  //返回结果
  result += ab.getMessage();
  //实例化BA类
  BA ba = BA();
  //返回结果
  result += ba.getMessage();
  print(result);
}
