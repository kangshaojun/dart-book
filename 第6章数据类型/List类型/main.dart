void main() {

  //定义List
//  var list = [1, 2, 3];

  //List索引
//  var list = [1,2,3,4,5,6];
//  print(list.length);
//  print(list[list.length - 1]);

    //常量列表
    var constList = const [1, 2, 3, 4];
    //这一行会引发一个错误
    //constList[0] = 1;

    //数据源
//    var list1 = [4, 5, 6];
//    //使用...扩展了列表长度
//    var list2 = [1, 2, 3, ...list1];
//    print(list2.length);

    //变量为空
    var list1;
    //使用...? 先判断变量是否为空再进行扩展
    var list2 = [1, 2, 3, ...?list1];
    print(list2.length);


}
