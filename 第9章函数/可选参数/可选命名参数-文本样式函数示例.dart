void main() {
  textStyle('可选参数');
  textStyle('可选参数:',fontSize: 18.0);
  textStyle('可选参数:',fontSize: 18.0,bold: true);
}

//字体大小fontSize和是否加粗均为可选参数
void textStyle(String content,{double fontSize,bool bold}) {
  print(content + fontSize.toString() + " " + bold.toString());
}

