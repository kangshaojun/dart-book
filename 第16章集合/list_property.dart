//list_property.dart文件
void main(){

   List myList = ['张三','李四','王五'];
   //获取列表长度
   print(myList.length);
   //判断列表是否为空
   print(myList.isEmpty);
   //判断列表是否不为空
   print(myList.isNotEmpty);
   //对列表倒序排序
   print(myList.reversed);
   //对列表倒序排序并输出一个新的List
   var newMyList = myList.reversed.toList();
   print(newMyList);

}