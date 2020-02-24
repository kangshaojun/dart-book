//enum_color.dart文件
void main(){

  //定义一个颜色变量 默认值为蓝色
  Color aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      print('红色');
      break;
    case Color.green:
      print('绿色');
      break;
    default: //默认颜色
      print(aColor);  // 'Color.blue'
  }

}
//定义一个枚举
enum Color {
  red,
  green,
  blue
}