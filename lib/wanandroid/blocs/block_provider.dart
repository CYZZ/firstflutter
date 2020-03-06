import 'package:flutter/material.dart';

abstract class BlocBase {
  Future getData({String labelId, int page});

  Future onRefresh({String labelId});

  Future onLoadMore({String labelId});

  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;
  final bool userDispose;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
    this.userDispose: true,
  }) : super(key: key);


  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
//  @override
//  State<BlocProvider> createState() {
//    // TODO: implement createState
//    return _BlocProviderState<T>();
//  }

  static Type _typeOf<T>() => T;

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider> {
  @override
  void dispose() {
    if (widget.userDispose) widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
