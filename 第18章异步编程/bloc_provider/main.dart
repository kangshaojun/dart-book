//stream_bloc_provider_main.dart文件
import 'package:flutter/material.dart';

import 'blocs/bloc_provider.dart';
import 'blocs/bloc_counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlocProvider示例',
      //将BlocProvider放入顶层组件
      home: BlocProvider(
          //首页
          child: MyHomePage(),
          //所有的bloc
          blocs: [BlocCounter()]),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //计数器值
  int _counter = 0;

  //增加方法
  void _incrementCounter() {
    //通过BlocProvider的of方法获取到所有bloc
    //然后取第一个bloc并调用其increment方法向流中添加数据
    BlocProvider.of<BlocCounter>(context).first.increment(_counter);
  }

  @override
  void initState() {
    //通过BlocProvider的of方法获取到所有bloc
    //然后取第一个bloc并调用其listen进行监听流的数据
    BlocProvider.of<BlocCounter>(context).first.counter.listen((_count) {
      //设置状态,重新渲染界面
      setState(() {
        _counter = _count;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocProvider示例'),
      ),
      body: Center(
        //渲染流中取出的数据
        child: Text(
          '$_counter',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      //增加按钮
      floatingActionButton: FloatingActionButton(
        //点击事件
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
