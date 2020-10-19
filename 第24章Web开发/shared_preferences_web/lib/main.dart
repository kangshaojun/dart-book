//lib/main.dart文件
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web共享变量示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebDemo(),
    );
  }
}

class WebDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebDemoState();
}

class WebDemoState extends State<WebDemo> {
  //实例化本地存储对象
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //呢称及选择语言的值
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initFromCache();
  }

  @override
  void dispose() {
    super.dispose();
    controller = null;
  }

  //从缓存中获取信息填充
  void initFromCache() async {
    final SharedPreferences prefs = await _prefs;
    //根据键key获取本地存储的值value
    final key_content = prefs.getString("key_content");
    //获取到缓存中的值后，使用setState更新界面信息
    setState(() {
      controller.text = (key_content == null ? "" : key_content);
    });
  }

  //保存界面的输入选择信息
  void saveInfo(String key_content) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("key_content", key_content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Web共享变量示例'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '请输入内容',
                ),
              ),
              MaterialButton(
                child: Text('保存'),
                onPressed: () {
                  saveInfo(controller.text);
                },
              ),
            ],
          ),
        )
    );
  }
}