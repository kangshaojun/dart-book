//implements_animal.dart文件
void main(){
  //实例化Dog类
  var d = Dog();
  d.name = "小狗";
  d.eat();
  d.display();
  d.swim();
  d.walk();
}

//抽象类Animal
abstract class Animal{
  //动物名称属性
  String name;
  //显示动物名称抽象方法
  void display(){
    print("动物的名字是:${name}");
  }
  //动物进食抽象方法
  void eat();
}

//抽象类作为接口 SwimAbility游泳能力
abstract class SwimAbility{
  void swim();
}

//普通类作为接口 WalkAbility行走能力
class WalkAbility{
  //行走方法
  void walk(){
    //空方法
  }
}

//Dog类继承Animal同时实现Swimable和Walkable接口
class Dog extends Animal implements SwimAbility, WalkAbility{
  //重写父类Animal方法
  @override
  void eat() {
    print(this.name + "有进食的能力");
  }

  //实现SwimAbility接口 并重写其swim方法
  @override
  void swim() {
    print(this.name + "有游泳的能力");
  }

  //实现WalkAbility接口 并重写其walk方法
  @override
  void walk() {
    print(this.name + "有行走的能力");
  }
}