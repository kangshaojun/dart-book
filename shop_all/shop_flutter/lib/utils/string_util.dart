//utils/string_util.dart文件
import 'dart:convert';
//字符串处理工具
class StringUtil {
  //字符串json编码
  static String encode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }
  //字符串json解码
  static String decode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
