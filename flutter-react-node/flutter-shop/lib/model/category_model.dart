//model/category_model.dart文件
//分类列表数据模型
class CategoryListModel{

  //分类数据列表
  List<CategoryModel> list = [];

  //构造函数
  CategoryListModel({this.list});

  //取Json数据
  CategoryListModel.fromJson(Map<String,dynamic> json){
    if(json['list'] != null){
      list = new List<CategoryModel>();
      json['list'].forEach((v){
        list.add(CategoryModel.fromJson(v));
      });
    }
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    if(this.list != null){
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

//分类数据模型
class CategoryModel{
  //Id
  int id;
  //名称
  String name;
  //父分类Id
  int pid;
  //等级
  String level;
  //图片
  String image;

  //构造函数
  CategoryModel({this.id,this.name,this.pid,this.level,this.image});

  //取Json数据
  CategoryModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    pid = json['pid'];
    level = json['level'];
    image = json['image'];
  }

  //将数据转成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['level'] = this.level;
    data['image'] = this.image;
    return data;
  }

}
