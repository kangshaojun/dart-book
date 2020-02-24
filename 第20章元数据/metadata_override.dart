//metadata_override.dart文件
//动物类
class Animal {
  //动物会吃
  void eat(){
    print('动物会吃');
  }
  //动物会跑
  void run(){
    print('动物会跑');
  }
}
//人类
class Human extends Animal {
  void say(){
    print('人会说话');
  }

  void study(){
    print('人类也会吃');
  }

  //使用了元数据表示重写方法
  @override
  void eat(){
    print('人类也会吃');
  }
}

void main(){
  print('实例化一个动物类');
  Animal animal = Animal();
  animal.eat();
  animal.run();

  print('实例化一个人类');
  Human human = Human();
  //重写的方法
  human.eat();
  human.run();
  human.say();
  human.study();
}