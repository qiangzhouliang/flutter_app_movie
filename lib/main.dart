//导入相关控件
import 'package:flutter/material.dart';

import 'MyHome.dart';
//入口函数
void main() => runApp(MyApp());
//无状态控件  StatelessWidget   有状态控件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //每个项目最外层，必须有 MaterialApp
    return MaterialApp(
      //
      title: '女神专用',
      //主题
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //通过home指定首页
      home: MyHome(),
    );
  }
}

