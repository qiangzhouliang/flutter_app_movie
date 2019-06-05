import 'package:flutter/material.dart';
class MovieDetail extends StatefulWidget{
    MovieDetail({Key key,@required this.id,@required this.title}):super(key:key);
    final String id;
    final String title;
  @override
  _MovieDetailState createState() {
    return _MovieDetailState();
  }
}
//状态管理类
class _MovieDetailState extends State<MovieDetail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title),centerTitle: true,),
        body: Text("电影id为：${widget.id}",),
    );
  }
}