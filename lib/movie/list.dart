import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'detail.dart';
//请求数据dio
Dio dio = new Dio();
//有状态的
class MovieList extends StatefulWidget{
    //构造函数,固定写法
    MovieList({Key key,@required this.mt}):super(key:key);
    //电影类型
    final String mt;
  @override
  _MovieListState createState() {
    return _MovieListState();
  }
}

//有状态控件，必须结合一个状态管理类 来进行实现,命名有规则
//MovieList 管理的谁，<> 里面写谁
class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin{
    //默认显示第一页数据
    int page = 1;
    //每页显示的数据条数
    int pageSize = 10;
    //电影列表数据
    var mList = [];
    //总数据条数，实现分页效果
    var total = 0;
    //控件被创建的时候，会执行 initState
    @override
  void initState() {
    super.initState();
    getMoveList();
  }
    //渲染当前这个 MovieList 控件的UI结构
  @override
  Widget build(BuildContext context) {
    //渲染页面
    return ListView.builder(
        itemCount: mList.length,//循环次数
        itemBuilder: (BuildContext ctx,int i){
            //每次循环，都拿到当前的电影item项
            var mItem = mList[i];
            //代表横向渲染
            return GestureDetector(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext ctx){return MovieDetail(id: mItem['id'],title: mItem['title'],);}
                    ));
                },
                child: Container(
                    height: 200,
                    //距离左边距为10
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
                    child: Row(
                        children: <Widget>[
                            Image.network(mItem['images']['small'],width: 130,height: 180,fit: BoxFit.cover,),
                            //纵向排列
                            Container(
                                //距离左侧10个像素
                                padding: EdgeInsets.only(left: 10),
                                height: 200,
                                child: Column(
                                    //左对齐
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    //主轴平分
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                        Text('电影名称：${mItem['title']}'),
                                        Text('上映年份：${mItem['year']}年'),
                                        Text('电影类型：${mItem['genres'].join('，')}'),
                                        Text('豆瓣评分：${mItem['rating']['average']}分'),
                                        Text('主要演员：${mItem['title']}')
                                    ],
                                ),
                            )
                        ],
                    ),
                ),
            );
        },
    );
  }

  //获取电影列表数据
  getMoveList() async {
      //偏移量（page -1 ）* pageSize
      int offset = (page - 1) * pageSize;
      var response = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pageSize');
      //服务器返回的数据
      var result = response.data;
      //今后只要为私有数据赋值，都需要把赋值的操作，放到setState中，否则页面不会更新
      setState(() {
          //通过dio返回的数据必须使用[] 来访问
        mList = result['subjects'];
        total = result['total'];
      });
  }

  //保持列表状态
  @override
  bool get wantKeepAlive => true;
}