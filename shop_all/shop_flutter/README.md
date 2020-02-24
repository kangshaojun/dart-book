flutter packages pub run build_runner build

引发的原因
原因其实日志也说明了。我在提交代码的时候把flutter packages pub run build_runner build生成的xxxx.g.dart也提了上去。运行flutter packages pub run build_runner build不光生成了xxxx.g.dart。
同时还成了一个dart_tool/build目录，入过程所说的只运行app是没有问题的，之前xxxx.g.dart还是可用的。但是再生成新的xxxx.g.dart因为缺少之前生成dart_tool/build目下的文件就会报错。

because the`.dart_tool/build` folder was deleted, or you are submitting generated files to your source repository
复制代码
解决
命令行运行：

//清除之前生成的文件，如果直接运行下面的不行。可以先尝试运行这个
 flutter packages pub run build_runner clean
//可以直接运行这个
flutter packages pub run build_runner build --delete-conflicting-outputs
