//mixin_object_type.dart文件
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
  //实例化AB类
  AB ab = AB();
  print(ab is P);  //true
  print(ab is A);  //true
  print(ab is B);  //true

  //实例化BA类
  BA ba = BA();
  print(ba is P);  //true
  print(ba is A);  //true
  print(ba is B);  //true

}
