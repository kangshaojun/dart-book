//utils/fluro_convert_util.dart文件
import 'dart:convert';
//Fluro参数处理工具
class FluroConvertUtil{
  //Object转为String Json
  static String objectToString<T>(T t) {
    return fluroCnParamsEncode(jsonEncode(t));
  }

  //String Json转为Map
  static Map<String, dynamic> stringToMap(String str) {
    return json.decode(fluroCnParamsDecode(str));
  }
  //Fluro传递中文参数前先转换,Fluro不支持中文传递
  static String fluroCnParamsEncode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  //Fluro传递后取出参数解析
  static String fluroCnParamsDecode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}