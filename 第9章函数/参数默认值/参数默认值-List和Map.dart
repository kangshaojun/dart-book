void main() {
  listAndMapParam();
}
//List及Map默认参数使用
void listAndMapParam({
  List<String> list = const ['A', 'B', 'C'],
  Map<int, String> map = const {
        0: 'one',
        1: 'second',
        2: 'third'
  }}){
  print('list:  $list');
  print('map: $map');
}