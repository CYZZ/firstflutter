import 'package:flutter/material.dart';
import 'count_bloc.dart';

class BlocProvider extends InheritedWidget {
  CountBloc bloc = CountBloc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  // 小提示：这里的updateShouldNotify，需要传入一个InheritedWidget oldWidget，但是我们强制返回true，所以传一个"_"占位

  static CountBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;

  static BlocProvider ofTest(BuildContext context) {
    print('被外界调用了context = $context');
    return context.inheritFromWidgetOfExactType(BlocProvider);
  }
}
