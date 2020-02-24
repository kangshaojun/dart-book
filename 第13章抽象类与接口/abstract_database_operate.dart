//abstract_database_operate.dart文件
void main() {

  //声明类型为DataBaseOperate 实例化类型为DataBaseOperateImpl
  DataBaseOperate db = DataBaseOperateImpl();
  //调用成员方法
  db.insert();
  db.delete();
  db.update();
  db.query();

}

//数据库操作抽象类
abstract class DataBaseOperate {
  void insert(); //定义插入的方法
  void delete(); //定义删除的方法
  void update(); //定义更新的方法
  void query(); //定义一个查询的方法
}

//数据库操作实现类
class DataBaseOperateImpl extends DataBaseOperate {

  //实现了插入的方法
  void insert(){
    print('实现了插入的方法');
  }

  //实现了删除的方法
  void delete(){
    print('实现了删除的方法');
  }

  //实现了更新的方法
  void update(){
    print('实现了更新的方法');
  }

  //实现了一个查询的方法
  void query(){
    print('实现了一个查询的方法');
  }

}