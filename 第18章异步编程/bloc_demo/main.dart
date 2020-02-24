//stream_bloc_main.dart文件
import 'package:flutter/material.dart';

import 'blocs/bloc_counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc示例',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState(BlocCounter());
}

class _MyHomePageState extends State<MyHomePage> {

  //组件计数变量
  int _counter = 0;

  //计数器Bloc
  final BlocCounter bloc;

  _MyHomePageState(this.bloc);

  //计数增加方法
  void _incrementCounter() {
    //调用bloc的方法
    bloc.increment(_counter);
  }

  @override
  void initState() {
    //监听Bloc里的数据
    bloc.counter.listen((_count) {
      //设置状态值
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
        title: Text('Bloc示例'),
      ),
      body: Center(
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