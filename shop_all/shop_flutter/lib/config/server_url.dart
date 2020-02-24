//config/server_url.dart文件
//服务端接口地址
class ServerUrl {
  static const String BASE_URL = 'http://localhost:8080/client';//基础地址

  static const String HOME_URL = BASE_URL+'/home/index';//首页数据

  static const String CATEGORY_FIRST = BASE_URL+'/catalog/getfirstcategory';//商品分类第一级
  static const String CATEGORY_SECOND = BASE_URL+'/catalog/getsecondcategory';//商品分类第二级

  static const String GOODS_CATEGORY = BASE_URL+"/goods/category";//获取商品分类数据
  static const String GOODS_LIST = BASE_URL+'/goods/list';//获取商品数据列表
  static const String GOODS_DETAILS_URL = BASE_URL+'/goods/detail';//商品详情

  static const String REGISTER = BASE_URL+'/auth/register';//注册
  static const String LOGIN = BASE_URL+'/auth/login';//登录
  static const String LOGIN_OUT = BASE_URL+"/auth/logout";//退出登录

  static const String CART_ADD = BASE_URL+'/cart/add';//加入购物车
  static const String CART_LIST = BASE_URL+'/cart/index';//购物车数据
  static const String CART_UPDATE = BASE_URL+'/cart/update';//更新购物车
  static const String CART_DELETE = BASE_URL+'/cart/delete';//删除购物车数据
  static const String CART_CHECK = BASE_URL+'/cart/checked';//购物车商品勾选
  static const String CART_BUY = BASE_URL+'/cart/checkout';//购物车下单
  static const String FAST_BUY = BASE_URL+'/cart/fastadd';//立即购买

  static const String ADDRESS_LIST = BASE_URL+'/address/list';//地址列表
  static const String ADDRESS_SAVE = BASE_URL+'/address/save';//增加地址
  static const String ADDRESS_DELETE = BASE_URL+'/address/delete';//删除地址
  static const String ADDRESS_DETAIL = BASE_URL+'/address/detail';//地址详情

  static const String COLLECT_LIST = BASE_URL+ '/collect/list'; //收藏列表
  static const String COLLECT_ADD_DELETE = BASE_URL+ '/collect/addordelete'; //添加或取消收藏

  static const String ORDER_SUBMIT = BASE_URL+ '/order/submit';// 提交订单
  static const String ORDER_LIST = BASE_URL+'/order/list';//我的订单
  static const String ORDER_DETAIL = BASE_URL+"/order/detail";//订单详情
  static const String ORDER_CANCEL = BASE_URL+"/order/cancel";//取消订单
  static const String ORDER_DELETE = BASE_URL+"/order/delete";//取消订单

}
