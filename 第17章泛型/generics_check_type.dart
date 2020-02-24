//generics_check_type.dart文件
//定义类A
class A {

}

//定义类B继承自类A
class B extends A {

}

//定义类C
class C {

}

//定义类SomeClass
class SomeClass<T extends A>{
  // ...
}

main() {
  //这种情况下是可以的，因为传入的类型符合限定（自身或者子类）
  var a = SomeClass<A>();
  var b = SomeClass<B>();
  //不显式指定泛型类型，也是可以的
  var c = SomeClass();
  //这种情况下不行，因为不符合限定
  //var d = SomeClass<C>();
}