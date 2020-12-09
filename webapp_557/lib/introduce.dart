import 'package:flutter/material.dart';
import 'dart:async';

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(
          content: Text('車內擁擠程度'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20,
            width: width*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(2),
            child: Row(
              children: <Widget> [
                Container(
                  width: width*0.25-2,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40)
                    ),
                    color: Colors.green,
                  ),
                  child: Text('50% ', textAlign: TextAlign.right,style: TextStyle(color:Colors.black87)),
                ),
                Container(
                  width: width*0.1,
                  height: 16,
                  color: Colors.amberAccent,
                  child: Text('70% ', textAlign: TextAlign.right,style: TextStyle(color:Colors.black87)),
                ),
                Container(
                  width: width*0.15-2,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Container(
                height: height*0.7,
                width: width*0.5,
                child: ListView(
                  children: <Widget> [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // width: width*0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '功能說明', style: TextStyle(color: Colors.white, fontSize:28)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text('1.\t道路速率等級', style: TextStyle(fontSize:20))
                        ),
                        Container(
                          // width: width*0.5,
                          padding: EdgeInsets.only(left:15, right:15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                margin: EdgeInsets.only(left:10, right:10),
                              ),
                              Text('順暢', style: TextStyle(fontSize:20),),
                            ],
                          ),
                        ),
                        Container(
                          // width: width*0.5,
                          padding: EdgeInsets.only(left:15, right:15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber,
                                ),
                                margin: EdgeInsets.only(left:10, right:10),
                              ),
                              Text('中等', style: TextStyle(fontSize:20),),
                            ],
                          ),
                        ),
                        Container(
                          width: width*0.5,
                          padding: EdgeInsets.only(left:15, right:15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                ),
                                margin: EdgeInsets.only(left:10, right:10),
                              ),
                              Text('壅塞', style: TextStyle(fontSize:20),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text('2.\t車內擁擠度等級\n\n如APP最下方量表所示。若該車無車內擁擠度資訊，則會顯示灰色。', style: TextStyle(fontSize:20), softWrap: true,)
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: <Widget>[
                        //     Crowding4(),
                        //     CarNo(text: '車號'),
                        //   ],
                        // ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Text('3.\t捷運進站倒數計時\n\n右下角紅色按鈕為士林捷運站各班次進站時間倒數。\n含淡水、北投、大安和象山等四個方向最近兩班車的時間倒數。', style: TextStyle(fontSize:20), softWrap: true,)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );

          }
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.description, color: Colors.white,),
          Text('說明', style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}

class AnimationFAB extends StatefulWidget {
  @override
  AnimationFABState createState() => AnimationFABState();
}

class AnimationFABState extends State<AnimationFAB> 
with SingleTickerProviderStateMixin{
  bool isOpened = false;
  AnimationController _aControl;
  Animation<Color> _aColor;
  Animation<double> _aIcon;
  Animation<double> _tButton;
  Curve _curve = Curves.easeOut;
  double _fabH = 56;
  @override
  void initState() {
    _aControl = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
    ..addListener(() {
      setState((){});
    });
    _aIcon = Tween<double>(begin: 0, end: 1).animate(_aControl);
    _aColor = ColorTween(
      begin: Colors.purpleAccent,
      end: Colors.deepPurple,
    ).animate(CurvedAnimation(
      parent: _aControl,
      curve: Interval(
        0,
        1,
        curve: Curves.linear,
      ),
    ));
    _tButton = Tween<double>(
      begin: _fabH,
      end: 11.4,
    ).animate(CurvedAnimation(
      parent: _aControl,
      curve: Interval(
        0,
        0.75,//速度
        curve: _curve,
      ),
    ));
    super.initState();
  }
  @override
  void dispose() {
    _aControl.dispose();
    super.dispose();
  }
  animate() {
    if (!isOpened) {
      _aControl.forward();
    } else {
      _aControl.reverse();
    }
    isOpened = !isOpened;
  }
  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _aColor.value,
      mini: true,
      onPressed: animate,
      child: AnimatedIcon(
        icon: AnimatedIcons.close_menu,
        progress: _aIcon,
      ),
    );
  }
  Widget crowdingLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Container(
        //   child: FloatingActionButton(
        //     onPressed: (){},
        //     mini: true,
        //     backgroundColor: Colors.deepPurple,
        //     child: Text('擁擠\n程度', textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
        //   ),
        // ),
        if (isOpened == false) 
          FutureBuilder(
            future: Future.delayed(Duration(milliseconds: 1)),
            builder: (context, snapshot) {
        // Checks whether the future is resolved, ie the duration is over
                if (snapshot.connectionState == ConnectionState.done) 
                    return Stack(
                      // alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                      children: <Widget>[
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('擁擠\n程度', style: TextStyle(fontSize:12, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            Container(
                              height: 104,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepPurple
                              ),
                              padding: EdgeInsets.all(2),
                              child: Container(
                                height:100,
                                width:20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12)
                                        ),
                                        color: Colors.green,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('50', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 16,
                                      color: Colors.amberAccent,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('70', style: TextStyle(color: Colors.brown), textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 26,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)
                                        ),
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text('100\n(%)', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,)
                          ],
                        ),
                        SizedBox(width:35),//往左一點以達到置中       
                      ],
                    );
                else 
                    return Container(); // Return empty container to avoid build errors
            }
          ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Transform(
          transform: Matrix4.translationValues(
            0,
            _tButton.value*3.9,
            0,
          ),
          child: crowdingLabel(),
        ),
        toggle(),
      ],
    );
  }
}