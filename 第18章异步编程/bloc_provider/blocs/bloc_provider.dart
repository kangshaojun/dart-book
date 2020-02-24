//stream_bloc_provider.dart文件
import 'package:flutter/widgets.dart';

import 'bloc_base.dart';

//返回类型
Type _typeOf<T>() => T;

//BlocProvider是一个有状态的组件,泛型类型为BlocBase的子类
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.blocs,
  }) : super(key: key);

  //定义child
  final Widget child;
  //定义blocs
  final List<T> blocs;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  /**
   * BlocProvider的重要方法of
   * 泛型类型为BlocBase的子类
   * 返回数据为blocs列表
   */
  static List<T> of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
    //通过BuildContext可以跨组件获取对象
    //ancestorInheritedElementForWidgetOfExactType方法获得指定类型的InheritedWidget进而获取它的共享数据。
    _BlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    //返回所有的blocs
    return provider?.blocs;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {

  //重写销毁方法
  @override
  void dispose() {
    //关闭所有的bloc流
    widget.blocs.map((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return _BlocProviderInherited<T>(
      blocs: widget.blocs,
      child: widget.child,
    );
  }
}

/**
 * InheritedWidget是Flutter的一个功能型的Widget基类
 * 它能有效地将数据在当前Widget树中向它的子Widget树传递
 */
class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.blocs,
  }) : super(key: key, child: child);

  //所有的bloc
  final List<T> blocs;
  
  //用来告诉InheritedWidget如果对数据进行了修改，
  //是否必须将通知传递给所有子Widget(已注册/已订阅）
  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
