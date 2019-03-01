import 'package:flutter/material.dart';

class CommonDivider{
  static Widget buildDivider(){
    return Padding(
      padding: EdgeInsets.only(left: 12.0,right: 12.0),
      child: Divider(height: 1,),
    );
  }
}