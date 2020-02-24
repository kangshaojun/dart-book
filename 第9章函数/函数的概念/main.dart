void main() {

  int c = max(2,30);
  print(c);

}

//取两个变量的最大值
//int max(int a, int b) {
//  return a >= b ? a:b;
//}

//去掉变a,b及返回类型,取最大值依然可用
//max(a,b) {
//  return a >= b ? a:b;
//}


//使用箭头=>语法简写函数
int max(int a, int b) => a >= b ? a:b;

