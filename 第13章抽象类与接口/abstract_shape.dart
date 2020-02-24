//abstract_shape.dart文件
void main(){
  //创建正方形类对象
  Square square = Square(5,4);
  print("正方形的面积为："+square.area().toString());
  //创建三角形类对象
  Triangle triangle = Triangle(2,5);
  print("三角形的面积为："+triangle.area().toString());
}

//abstract_shape.dart文件
//图形抽象类Shape
abstract class Shape {
  //几何图形的长
  double width;
  //几何图形的宽
  double height;

  //定义抽象方法 计算面积
  double area();
}

//abstract_shape.dart文件
//正方形类
class Square extends Shape {

  Square(double width,double height) {
    this.width=width;
    this.height=height;
  }
  //重写父类中的抽象方法，实现计算正方形面积的功能
  @override
  double area(){
    return super.width*super.height;
  }
}
//abstract_shape.dart文件
//三角形类
class Triangle extends Shape {
  Triangle(double width,double height){
    this.width=width;
    this.height=height;
  }
  //重写父类中的抽象方法，实现计算三角形面积的功能
  @override
  double area(){
    return 0.5*this.width*this.height;
  }
}