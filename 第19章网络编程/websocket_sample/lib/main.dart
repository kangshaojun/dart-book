//websocket_sample/lib/main.dart文件
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'random_string.dart';
import 'package:date_format/date_format.dart';

void main() {
  runApp(MaterialApp(
    title: 'WebSocket示例',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket示例'),
      ),
      body: ChatPage(),
    );
  }
}

//聊天页面
class ChatPage extends StatefulWidget {
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  //用户Id
  var userId = '';
  //用户名称
  var userName = '';
  //聊天消息
  var messages = [];
  //WebSocket对象
  IOWebSocketChannel channel;
  //初始化
  init() async {
    //使用随机数创建userId
    userId = randomNumeric(6);
    //使用随机数创建userName
    userName = "u_" + randomNumeric(6);
    return await createWebsocket();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    //当页面销毁时关闭WebSocket
    closeWebSocket();
  }

  //创建并连接Socket服务器
  void createWebsocket() async {
    //连接Socket服务器
    channel = await IOWebSocketChannel.connect('ws://192.168.2.168:3000');
    //定义加入房间消息
    var message = {
      'type': 'joinRoom',
      'userId': userId,
      'userName': userName,
    };
    //Json编码
    String text = json.encode(message).toString();
    //发送消息至服务器
    channel.sink.add(text);
    //监听到服务器返回消息
    channel.stream.listen((data) => listenMessage(data),onError: onError,onDone: onDone);
  }
  //监听服务端返回消息
  void listenMessage(data){
    //Json解码
    var message = jsonDecode(data);
    print("receive message:" + data);
    //接收到消息 判断消息类型为公共聊天chat_public
    if (message['type'] == 'chat_public'){
      //插入消息至消息列表
      setState(() {
        messages.insert(0, message);
      });
    }

  }
  //发送消息
  void sendMessage(type,data){
    //定义发送消息对象
    var message = {
      //消息类型
      "type": 'chat_public',
      'userId': userId,
      'userName': userName,
      //消息内容
      "msg": data
    };
    //Json编码
    String text = json.encode(message).toString();
    print("send message:" + text);
    //发送消息至服务器
    channel.sink.add(text);
  }
  //监听消息错误回调方法
  void onError(error){
    print('error:${error}');
  }
  //当WebSocket断开回调方法 此处可以做重连处理
  void onDone() {
    print('WebSocket断开了');
  }
  //前端主动关闭WebSocket处理
  void closeWebSocket(){
    //关闭链接
    channel.sink.close();
    print('关闭WebSocket');
  }

  //发送消息
  void handleSubmit(String text) {
    textEditingController.clear();
    //判断输出框内容是否为空
    if (text.length == 0 || text == '') {
      return;
    }
    //发送公共聊天消息
    sendMessage('chat_public', text);
  }

  //文本编辑控制器
  final TextEditingController textEditingController = TextEditingController();
  //输入框获取焦点
  FocusNode textFocusNode = FocusNode();

  //创建消息输入框组件
  Widget textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                //提示内容:请输入消息
                decoration: InputDecoration.collapsed(hintText: '请输入消息'),
                //文本编辑控制器
                controller: textEditingController,
                //发送消息
                onSubmitted: handleSubmit,
                //获取焦点
                focusNode: textFocusNode,
              ),
            ),
            //发送按钮容器
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              //发送按钮
              child: IconButton(
                icon: Icon(Icons.send),
                //按下发送消息
                onPressed: () => handleSubmit(textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  //根据索引创建一个带动画的消息组件
  Widget messageItem(BuildContext context, int index) {
    //获取一条聊天消息
    var item = messages[index];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      //水平布局 左侧为消息 右侧为头像
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //左侧空余部分
          Expanded(
            child: Container(),
          ),
          //垂直排列 消息时间 消息内容
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(formatDate(DateTime.now(), [HH, ':', nn, ':', ss]),style: Theme.of(context).textTheme.subhead),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(item['msg'].toString()),
              )
            ],
          ),
          //我的头像
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              child: Text(item['userName'].toString()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //使用安全区域组件防止部分iOS设备询问不能正常显示
    return SafeArea(
      //垂直布局
      child: Column(
        children: <Widget>[
          //获取消息列表数据
          Flexible(
            //使用列表渲染消息
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              //消息组件渲染
              itemBuilder: messageItem,
              //消息条目数
              itemCount: messages.length,
            ),
          ),
          //分隔线
          Divider(
            height: 1.0,
          ),
          //消息输入框及发送按钮
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: textComposerWidget(),
          )
        ],
      ),
    );
  }
}
