//async_list_refresh.dart文件
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('RefreshIndicator示例'),
        ),
        body: DropDownRefresh(),
      ),
    );
  }
}

//创建一个有状态的组件
class DropDownRefresh extends StatefulWidget {
  @override
  _DropDownRefreshState createState() => _DropDownRefreshState();
}

class _DropDownRefreshState extends State<DropDownRefresh> {
  //列表要展示的数据
  List list = List();
  //ListView的控制器
  ScrollController scrollController = ScrollController();
  //页数
  int page = 0;
  //是否正在加载
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //初始化列表数据
    initData();
    //添加滚动监听事件
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        //上拉加载更多数据
        getMoreData();
      }
    });
  }
  //初始化列表数据,加延时模仿网络请求
  Future initData() async {
    //使用Future.delayed延迟一秒执行
    await Future.delayed(Duration(seconds: 1),(){
      //设置状态渲染列表
      setState(() {
        //初始15条数据
        list = List.generate(15, (i) => '初始数据 $i');
      });
    });
  }

  //下拉刷新方法,为list重新赋值
  Future onRefreshData() async {
    await Future.delayed(Duration(seconds: 1), (){
      //设置状态渲染列表
      setState(() {
        //重新生成20条数据
        list = List.generate(20, (i) => '刷新后的数据 $i');
      });
    });
  }

  //根据index渲染某一行数据
  Widget renderListItem(BuildContext context, int index){
    //当index显示list.lenth时显示列表项
    if (index < list.length) {
      return ListTile(
        title: Text(list[index]),
      );
    }
    //当索引大于等于list.length时,显示加载更多数据组件
    return showGetMoreWidget();
  }

  //加载更多时显示的组件,给用户提示
  Widget showGetMoreWidget() {
    //居中显示'加载中...'
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            //圆形刷新提示组件
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  //上拉加载更多
  Future getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      //延迟一条生成更多数据
      await Future.delayed(Duration(seconds: 1),(){
        //设置状态渲染列表
        setState(() {
          //每上拉一次重新生成5条件数据,添加至现有列表里
          list.addAll(List.generate(5, (i) => '第$page次上拉来的数据'));
          //当前页自增
          page++;
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 标题
        title: Text(
          '下拉刷新 上拉加载更多',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        // 标题居中
        centerTitle: true,
        // 取消默认阴影
        elevation: 0,
        backgroundColor: Color(0xffEDEDED),
      ),
      //刷新组件
      body: RefreshIndicator(
        //刷新回调方法
        onRefresh: onRefreshData,
        //构建列表
        child: ListView.builder(
          //列表项渲染
          itemBuilder: renderListItem,
          //列表项个数
          itemCount: list.length + 1,
          controller: scrollController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
