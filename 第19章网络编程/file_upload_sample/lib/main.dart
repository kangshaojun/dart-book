//file_upload_sample/lib/main.dart文件
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    title: '图片上传示例',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片上传示例'),
      ),
      body: ImagePickerPage(),
    );
  }
}

//图片选择上传页面
class ImagePickerPage extends StatefulWidget {
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  //记录选择的照片
  File _image;

  //当图片上传成功后,记录当前上传的图片在服务器中的位置
  String _imgServerPath;

  //选择相册图片
  Future _getImageFromGallery() async {
    //打开相册并选择图片
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //设置状态
    setState(() {
      //图片文件
      _image = image;
    });
  }

  //上传图片到服务器
  _uploadImage() async {
    //创建Form表单数据
    FormData formData = FormData.from({
      "file": UploadFileInfo(_image, "imageName.png"),
    });
    //发起Post请求
    var response = await Dio()
        .post("http://192.168.2.168:3000/uploadImage/", data: formData);
    print(response);
    //上传成功返回数据
    if (response.statusCode == 200) {
      var data = response.data['data'];
      print(data[0]['path']);
      setState(() {
        //图片上传后的地址
        _imgServerPath = "http://192.168.2.168:3000${data[0]['path']}";
        print(_imgServerPath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              _getImageFromGallery();
            },
            child: Text("打开相册"),
          ),
          SizedBox(height: 10),
          //展示选择的图片
          _image == null
              ? Center(child: Text("没有选择图片"),)
              : Image.file(
                  _image,
                  fit: BoxFit.cover,
                ),
          SizedBox(height: 10),
          FlatButton(
            onPressed: () {
              _uploadImage();
            },
            child: Text("上传图片到服务器"),
          ),
          SizedBox(height: 10),
          _imgServerPath == null
              ? Center(child: Text("没有上传图片"),)
              : Image.network(_imgServerPath),
        ],
      ),
    );
  }
}
