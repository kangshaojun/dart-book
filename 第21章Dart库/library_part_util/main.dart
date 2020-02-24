//library_part_main.dart文件
import './util.dart';

void main() {

  //使用日志工具
  Logger logger = Logger('Demo');
  logger.debug('这是调试信息');
  logger.error('这是错误信息');
  logger.warn('这是警告信息');
  //logger.failure('这是失败信息');

  //使用计算工具
  print(add(12, 34));
  print(sub(30,20));
}

