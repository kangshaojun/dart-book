//extends_basic_sample.dart文件
void main() {
  //实例化动物类
  Animal animal = Animal();
  //实例化猫类
  Cat cat = Cat();
  //动物名称属性
  animal.name = "动物";
  //猫名称属性
  cat.name = "猫";
  //猫颜色属性就 属于子类的特征
  cat.color = "黑色";
  //动物会吃方法
  animal.eat();
  //猫会吃方法
  cat.eat();
  //动物会爬树方法 属于子类的特征
  cat.climb();
}

//动物类
class Animal{

  //属性
  String name;

  //父类方法
  void eat(){
    print("${name}:会吃东西");
  }
}

//猫类继承动物类
class Cat extends Animal{

  //子类属性
  String color;

  //子类方法
  void climb(){
    print("${color}的${name}:会爬树");
  }
}
