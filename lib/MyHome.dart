import 'package:flutter/material.dart';

import 'movie/list.dart';

class MyHome extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        //在flutter中 每个控件都是一个类
        return DefaultTabController(length: 3, child: Scaffold(
            appBar: AppBar(
                title: Text('电影列表'),
                centerTitle: true,
                //右侧行为按钮
                actions: <Widget>[
                    IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){}
                    )
                ],
            ),
            //侧边栏
            drawer: Drawer(
                child: ListView(
                    //设置listView的内边距为0
                    padding: const EdgeInsets.all(0),
                    children: <Widget>[
                        UserAccountsDrawerHeader(
                            accountName: Text('张三'),
                            accountEmail: Text('abc@itcast.cn'),
                            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316'),),
                            //美化当前控件
                            decoration: BoxDecoration(
                                //用户背景
                                    image: DecorationImage(
                                            image:NetworkImage('http://www.liulongbin.top:3005/images/bg1.jpg'),
                                            //背景填充模式
                                            fit: BoxFit.cover
                                    )
                            ),
                        ),
                        ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback),),
                        ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings),),
                        ListTile(title: Text('我要发布'), trailing: Icon(Icons.send),),
                        //分割线控件
                        Divider(),
                        ListTile(title: Text('注销'), trailing: Icon(Icons.exit_to_app),),
                    ],
                ),
            ),
            //底部导航栏
            bottomNavigationBar: Container(
                //美化当前的Container
                decoration: BoxDecoration(color: Colors.black),
                //一般高度都是50
                height: 50,
                child: TabBar(
                    //设置文本样式
                    labelStyle: TextStyle(height: 0,fontSize: 10),
                    tabs: <Widget>[
                        Tab(icon: Icon(Icons.movie_filter),text: '正在热映',),
                        Tab(icon: Icon(Icons.movie_creation),text: '即将上映',),
                        Tab(icon: Icon(Icons.local_movies),text: 'Top250',)
                    ],
                ),
            ),
            //页面主体
            body: TabBarView(
                children: <Widget>[
                    MovieList(mt: 'in_theaters',),
                    MovieList(mt: 'coming_soon',),
                    MovieList(mt: 'top250',),
                ],
            ),
        ));
    }

}