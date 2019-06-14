import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: 300),
      child: Material(
        elevation: 16.0,
        child: Center(
          child: Text('测试侧边栏'),
        ),
      ),
    );
  }
}
