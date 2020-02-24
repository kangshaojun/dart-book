//main.dart文件
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:shop/router/routers.dart';
import 'package:shop/router/application.dart';
import 'package:shop/provider/user_info.dart';
import 'package:provider/provider.dart';

//入口程序
void main() {
  //启动应用
  runApp(ShopApp());
}

//根组件
class ShopApp extends StatelessWidget {
  ShopApp() {
    //定义路由
    final router = Router();
    //配置路由
    Routers.configureRoutes(router);
    //指定路由至Application对象,便于调用
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    //管理多个共享数据类
    return MultiProvider(
      providers: [
        //用户信息
        ChangeNotifierProvider(builder: (_) => UserInfoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
        onGenerateRoute: Application.router.generator,
        //定义主题
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      ),
    );
  }
}
