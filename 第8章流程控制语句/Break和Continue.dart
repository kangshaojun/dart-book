//break示例
void main() {
  //数组
  var arr = [0, 1, 2, 3, 4, 5, 6];
  //for循环
  for (var v in arr) {
    //跳出整个循环
    if(v == 2 ){
      break;
    }
    print(v);
  }
}

//continue示例
//void main() {
//  //数组
//  var arr = [0, 1, 2, 3, 4, 5, 6];
//  //for循环
//  for (var v in arr) {
//    //跳出当前循环 循环还继续朝下执行
//    if(v == 2 ){
//      continue;
//    }
//    print(v);
//  }
//}