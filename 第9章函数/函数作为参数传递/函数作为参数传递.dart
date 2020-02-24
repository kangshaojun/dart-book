void main(){
  //整型列表
  var listInt = [1, 2, 3];
  //把printIntValue作为参数
  listInt.forEach(printIntValue);
  //字符串列表
  var listString = ['A', 'B', 'C'];
  //把printStringValue作为参数
  listString.forEach(printStringValue);
}
//打印整型值
void printIntValue(int value) {
  print(value);
}
//打印字符串
void printStringValue(String value) {
  print(value);
}


/* Flutter源码分析
 * forEach参数为一个函数f
 * 使用for循环来多次调用函数f
 * 把参数element回传给函数f
 */
//void forEach(void f(E element)) {
//  for (E element in this) f(element);
//}