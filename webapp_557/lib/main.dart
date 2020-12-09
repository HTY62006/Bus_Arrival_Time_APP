import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:webapp_557/json/bus1.dart';
import 'package:webapp_557/json/bus2.dart';
import 'package:webapp_557/json/mrt_page.dart';
import 'dart:async';
import 'package:webapp_557/introduce.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '557公車動態',//網頁名稱
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),//AppBar標題
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer timer;
  @override
  // 如果畫面放著不管60秒更新一次
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 60), (Timer t)=>refreshPage());
  }
  void refreshPage() {
    setState(() {
      html.window.location.reload();
    });
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;//整個螢幕的高度
    double barh = kToolbarHeight;//拿到app bar的高度
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: <Widget> [
              DrawerHeader(
                child: Column(
                  children: <Widget> [
                    Text('Our Team',
                    style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                    Text(
                      '我們是一群來自東吳大學巨資學院的學生，希望能夠透過這項計畫來改善557路公車，讓服務更加完善，並提供此平台給大家使用。',
                      style: TextStyle(fontSize: 18.0,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('呂明頴老師',style: TextStyle(fontSize: 20.0)),
                subtitle: Text('指導教授',style: TextStyle(fontSize: 15.0),),
                leading: Icon(Icons.free_breakfast,color: Colors.indigo,size: 40.0,),
              ),
              ListTile(
                title: Text('李育綺',style: TextStyle(fontSize: 20.0),),
                subtitle: Text('隊長-巨資三B',style: TextStyle(fontSize: 15.0),),
                leading: Icon(Icons.person,color: Colors.indigoAccent,size: 40.0,),
              ),
              ListTile(
                title: Text('黃品嘉',style: TextStyle(fontSize: 20.0),),
                subtitle: Text('巨資四A',style: TextStyle(fontSize: 15.0),),
                leading: Icon(Icons.person,color: Colors.indigoAccent,size: 40.0,),
              ),
              ListTile(
                title: Text('陳品伃',style: TextStyle(fontSize: 20.0),),
                subtitle: Text('巨資三B',style: TextStyle(fontSize: 15.0),),
                leading: Icon(Icons.person,color: Colors.indigoAccent,size: 40.0,),
              ),
              ListTile(
                title: Text('劉謦瑄',style: TextStyle(fontSize: 20.0),),
                subtitle: Text('巨資三B',style: TextStyle(fontSize: 15.0),),
                leading: Icon(Icons.person,color: Colors.indigoAccent,size: 40.0,),
              ),
              ListTile(
                title: Text('洪敦媛',style: TextStyle(fontSize: 20.0),),
                subtitle: Text('巨資三B',style: TextStyle(fontSize: 15.0),),
                leading: Icon(Icons.person,color: Colors.indigoAccent,size: 40.0,),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          // title: Text('557'),
          bottom: TabBar(
            tabs: [
              Text('往天文科學館',style: TextStyle(fontSize: 20.0),),
              Text('往東吳大學',style: TextStyle(fontSize: 20.0),),
            ],
            indicatorColor: Colors.purpleAccent[100],
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.purpleAccent[100],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AnimationFAB(),
            SizedBox(height:h-250-barh*2),
            MrtDetail(),
            SizedBox(height: 10), 
            FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                html.window.location.reload();
              },
            ),
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: TabBarView(
          children: <Widget>[
            RefreshIndicator(
              // child: BusDetail(),
              child: BusDetail(), 
              onRefresh: (){setState(() {
                html.window.location.reload();//下拉重整頁面
              });},
              ),
            RefreshIndicator(
              // child: Text('b'),
              child: BusDetail2(), 
              onRefresh: (){setState(() {
                html.window.location.reload();//下拉重整頁面
              });},
              ),
          ],
        ),
      ),
    );
  }
}
