//generics_type_error.dart文件
void main(){

  //List元素类型为String
  var languages = List<String>();
  //类型正确
  languages.addAll(['Java', 'Kotlin', 'Dart']);
  //使用整型值会报异常
  languages.add(50);
  
}