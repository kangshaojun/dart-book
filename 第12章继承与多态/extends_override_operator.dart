//extends_override_operator.dart文件
void main() {
  //初始化三个Rectangle对象
  Rectangle a = Rectangle(10,10);
  Rectangle b = Rectangle(5, 5);
  Rectangle c = Rectangle(10, 10);

  //判断a与b对象是否相等
  print("a == b : ${a == b}");
  //判断a与c对象是否相等
  print("a == c : ${a == c}");
  //a与b相加赋给d对象
  Rectangle d = a + b;
  print("a.width = ${a.width} a.height = ${a.height}");
  print("d.width = ${d.width} d.height = ${d.height}");
  //判断a与d对象是否相等
  print("a == d : ${a == d}");
}

//矩形类
class Rectangle{
  //宽度属性
  int width;
  //高度属性
  int height;

  //构造方法
  Rectangle(this.width,this.height);

  //重载==号操作符
  @override
  bool operator ==(dynamic other) {
    //判断other类型是否为Rectangle类
    if(other is! Rectangle){
      return false;
    }
    Rectangle temp = other;
    //当宽高的数值同时相等返回true否则返回false
    return (temp.width == width && temp.height == height);
  }

  //重载+号操作符
  @override
  Rectangle operator +(dynamic other){
    //判断other类型是否为Rectangle类
    if(other is! Rectangle){
      return this;
    }
    Rectangle temp = other;
    //宽度等于两个对象的宽度值相加  高度等于两个对象的高度值相加 
    return Rectangle( this.width + temp.width, this.height + temp.height);
  }
}
