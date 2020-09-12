//config/api_url.dart文件
//应用请求URL
class ApiUrl{

  //Url前缀
  static const String URL_HEAD = 'http://localhost:8000/api';

  //登录
  static const String USER_LOGIN = URL_HEAD + '/user/login';

  //注册
  static const String USER_REGISTER = URL_HEAD + '/user/register';

  //首页数据
  static const String HOME_CONTENT = URL_HEAD + '/client/home/content';

  //商品详情
  static const String GOOD_DETAIL = URL_HEAD + '/client/good/detail';

  //一级分类
  static const String CATEGORY_FIRST = URL_HEAD + '/client/category/first';

  //二级分类
  static const String CATEGORY_SECOND = URL_HEAD + '/client/category/second';

  //获取分类下的商品列表
  static const String CATEGORY_GOOD_LIST = URL_HEAD + '/client/category/good/list';

  //查询购物车商品列表
  static const String CART_LIST = URL_HEAD + '/client/cart/list';

  //更新购物车商品
  static const String CART_UPDATE = URL_HEAD + '/client/cart/update';

  //删除购物车商品
  static const String CART_DELETE = URL_HEAD + '/client/cart/delete';

  //添加商品至购物车
  static const String CART_ADD = URL_HEAD + '/client/cart/add';

  //提交订单
  static const String ORDER_ADD = URL_HEAD + '/client/order/add';

  //订单列表
  static const String ORDER_LIST = URL_HEAD + '/client/order/list';

}