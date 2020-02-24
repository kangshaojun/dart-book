//polymorphism_sample.dart文件
void main() {
  //子类Dog实例化并调用方法
  Dog d = Dog();
  d.eat();
  d.run();

  //子类Cat实例化并调用方法
  Cat c = Cat();
  c.eat();
  c.run();

  //声明成Animal类型 实例化为Dog类对象
  Animal animalDog = Dog();
  //调用eat方法体现多态性
  animalDog.eat();

  //声明成Animal类型 实例化为Cat类对象
  Animal animalCat = Cat();
  //调用eat方法体现多态性
  animalCat.eat();
}

//动物类
class Animal {

  //父类方法
  void eat(){
    print("动物会吃");
  }

  //父类方法
  void run(){
    print("动物会跑");
  }
}

//狗类继承自动物类
class Dog extends Animal {

  //重写父类函数体现多态性
  @override
  void eat() {
    print('小狗在啃骨头');
  }

  //重写父类函数体现多态性
  @override
  void run() {
    print('小狗在遛弯');
  }

  void printInfo() {
    print('我是小狗');
  }
}

//猫类继承自动物类
class Cat extends Animal {

  //重写父类方法体现多态性
  @override
  void eat() {
    print('小猫在吃鱼');
  }

  //重写父类方法体现多态性
  @override
  void run() {
    print('小猫在散步');
  }

  void printInfo() {
    print('我是小猫咪');
  }
}

