// 创建bloc
import 'dart:async';
class CountBloc {
  int _count;
  StreamController<int> _countController;

  CountBloc() {
    _count = 0;
    _countController = StreamController<int>();
  }

  Stream<int> get stream => _countController.stream;
  int get value => _count;

  increment() {
    _countController.sink.add(++_count);
    print('调用了CountBlock->increment');
  }

  dispose() {
    _countController.close();
  }

}
/*
 * 为什么使用私有变量"_"
 * 一个应用需要大量开发人员参与，你写的代码也许在几个月之后被另外一个开发看到，这时候，假如你的变量没有被保护的话，也许同样是count++,他会用countCountoller.sink.add(++_count)这种方法，而不是调用increment方法。
 *
 * 虽然这两种方式的效果完全一样，但是第二种方式将会让我们的business logic零散的混入其他代码中，提高的了代码的耦合度，非常不利于大妈的维护以及阅读，所以为了让bloc完全分离我们的业务逻辑，请务必使用私有变量。
 */