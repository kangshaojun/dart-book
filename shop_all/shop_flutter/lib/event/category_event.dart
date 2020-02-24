//event/category_event.dart文件
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();
//分类事件,用于点击一级分类后触发获取二级分类数据
class CategoryEvent {
  //分类id
  int id;
  //分类名称
  String categoryName;
  //分类图片
  String categoryImage;
  //构造方法
  CategoryEvent(this.id, this.categoryName, this.categoryImage);
}
