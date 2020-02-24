void main() {

  //不能直接判断字符串
//  var sex = '男';
//  if (sex) {
//    print('你的性别是!' + sex);
//  }

  //检查是否是空字符串
  var str = '';
  assert(str.isEmpty);

  //检查是否为0
  var value = 0;
  assert(value <= 0);

  //检查是否为null
  var isNull;
  assert(isNull == null);

  //检查是否是NaN
  var isNaN = 0 / 0;
  assert(isNaN.isNaN);
}
