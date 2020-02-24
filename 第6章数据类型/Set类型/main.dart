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
//    var list1;
//    //使用...? 先判断变量是否为空再进行扩展
//    var list2 = [1, 2, 3, ...?list1];
//    print(list2.length);

    //定义Set变量
    var set = Set();
    //输出0
    print(set.length);

    //错误Set没有固定元素的定义
    //var testSet2 = Set(2);

    //添加整型类型元素
    set.add(1);
    //重复添加同一个元素无效
    set.add(1);
    //添加字符串类型元素
    set.add("a");
    //输出{1, a}
    print(set);

    //判断是否包含此元素 输出true
    print(set.contains(1));

    //添加列表元素
    set.addAll(['b', 'c']);
    //输出{1, a, b, c}
    print(set);

    //移除某指定元素
    set.remove('b');
    //输出{1, a, c}
    print(set);

}
