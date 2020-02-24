    //异常处理示例
    try {
      // ···
    } on Exception catch (e) {
      print('Exception details:\n $e');
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    } finally {
      print('Do some thing:\n');
    }