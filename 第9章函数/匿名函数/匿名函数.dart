void main(){

  var list = ['I', 'love', 'study','dart'];
  //forEach函数里的参数即为一个匿名函数
  list.forEach((item) {
    print(item);
  });

  //箭头函数表示方法
  list.forEach(
          (item) => print(item)
  );

}

//Flutter setState源码分析
////调用State类里的setState方法来更改状态值，使得计数器加1
//setState(() {
////计数器变量，每次点击让其加1
//_counter++;
//});
//
//
//@protected
//void setState(VoidCallback fn) {
//  //设置状态处理
//}