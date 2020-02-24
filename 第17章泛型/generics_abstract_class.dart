//generics_abstract_class.dart文件
void main(){
  //实例化了内存缓存对象 类型为Map
  MemoryCache m = MemoryCache<Map>();
  m.setByKey('index', {"name":"张三","age":30});
}

//缓存抽象类
abstract class Cache<T>{
  //获取数据 类型为T
  getByKey(String key);
  //设置数据 类型为T
  void setByKey(String key, T value);
}

//文件缓存 实现了缓存接口
class FlieCache<T> implements Cache<T>{

  //重写getByKey方法
  @override
  getByKey(String key) {
    return null;
  }

  //重写setByKey方法
  @override
  void setByKey(String key, T value) {
    print("我是文件缓存 把key=${key}  value=${value}的数据写入到了文件中");
  }
}

//内存缓存 实现了缓存接口
class MemoryCache<T> implements Cache<T>{

  //重写getByKey方法
  @override
  getByKey(String key) {
    return null;
  }

  //重写setByKey方法
  @override
  void setByKey(String key, T value) {
    print("我是内存缓存 把key=${key}  value=${value} -写入到了内存中");
  }
}
