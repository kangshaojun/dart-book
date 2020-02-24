//generics_method.dart文件

void main(){
  print(getDataString('字符串'));
  print(getDataInt(30));
  print(getDataDynamic('dynamic'));
  //定义为int型 传值就传入int型 返回值也为int型
  print(getData<int>(12));
  print(getData<String>('hello'));
}

//普通方法 string类型
String getDataString(String value){
  return value;
}

//普通方法 int类型
int getDataInt(int value){
  return value;
}

//普通方法 不确定类型
dynamic getDataDynamic(value){
  return value;
}

//泛型方法 可以传入做任意类型
T getData<T>(T value){
  return value;
}
