//stream_stream_builder.dart文件
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamBuilder示例',
      home: MyHomePage(),
    );
  }
}

//有状态组件
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //计数器值
  int _count = 0;
  //实例化一个StreamController对象
  final StreamController<int> _streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder示例'),
      ),
      body: Container(
        child: Center(
          //StreamBuilder组件,数据类型为int
          child: StreamBuilder<int>(
              //指定stream属性
              stream: _streamController.stream,
              //构建器,可以通过AsyncSnapshot拿到流中的数据
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //这里不需要_count值,从流中取出data即可
                return snapshot.data == null
                    ? Text("0",style: TextStyle(fontSize: 36.0))
                    : Text("${snapshot.data}", style: TextStyle(fontSize: 36.0),
                );
              }),
        ),
      ),
      //操作按钮
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
            //向Stream里添加数据
            _streamController.sink.add(++_count);
          }),
    );
  }

  @override
  void dispose() {
    //当界面销毁时关闭Stream流
    _streamController.close();
    super.dispose();
  }
}