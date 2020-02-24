//object_getters_setters.dart文件
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  //获取right值
  num get right         => left + width;

  //设置right值 同时left也发生变化
  set right(num value)  => left = value - width;

  //获取bottom值
  num get bottom        => top + height;

  //设置bottom值 同时top也发生变化
  set bottom(num value) => top = value - height;
}

main() {
  var rect = Rectangle(3, 4, 20, 15);

  print('left:'+rect.left.toString());
  print('right:'+rect.right.toString());
  rect.right = 30;
  print('更改right值为30');
  print('left:'+rect.left.toString());
  print('right:'+rect.right.toString());

  print('top:'+rect.top.toString());
  print('bottom:'+rect.bottom.toString());
  rect.bottom = 50;
  print('更改bottom值为50');
  print('top:'+rect.top.toString());
  print('bottom:'+rect.bottom.toString());
}
