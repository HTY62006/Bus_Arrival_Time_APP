import 'package:flutter/material.dart';
import 'package:webapp_557/json/bus1.dart';
import 'dart:convert';

class MrtDetail extends StatefulWidget {
  @override
  MrtDetailState createState() => MrtDetailState();
}
class MrtDetailState extends State<MrtDetail> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/mrt_countdown.json'),
        builder:(context, snapshot) {
          List<MrtCountdown> mrt = 
            parseJson(snapshot.data.toString());
          return mrt.isNotEmpty
            ? MRTList(mrt: mrt)
            : Center(child: Text('a'));
        }
      ),
    );
  }
  List<MrtCountdown> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<MrtCountdown>((json) => new MrtCountdown.fromJson(json)).toList();
  }
}

class MRTList extends StatelessWidget {
  final List<MrtCountdown> mrt;
  MRTList({Key key, this.mrt}) : super (key: key);
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return _mrtWidget(context);
        });
        // showModalBottomSheet(
        // );
      },
      child: Icon(Icons.directions_subway),
      backgroundColor: Colors.red,
    );
  }
  Widget _mrtWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      height: 300,
      child: Column(
        children: <Widget> [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('淡水信義線'),
            backgroundColor: Colors.red,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Container(
                          width: width*0.5-20,
                          child: Text(
                            '往淡水',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),
                          ),
                        ),
                        // SizedBox(width: width-310,),
                        Container(
                          width: width*0.5-20,
                          child: Text(
                            '往北投',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left:20, right: 20,top: 20,bottom: 10),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: CountDown1(mrt: mrt,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: CountDown2(mrt: mrt,),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Container(
                          width: width*0.5-20,
                          child: Text(
                            '往象山',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),
                          ),
                        ),
                        // SizedBox(width: width-310,),
                        Container(
                          width: width*0.5-20,
                          child: Text(
                            '往大安',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left:20, right: 20,top: 20,bottom: 10),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: CountDown3(mrt: mrt,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: CountDown4(mrt: mrt,),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CountDown1 extends StatelessWidget {
  final List<MrtCountdown> mrt;
  CountDown1({Key key, this.mrt}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: width*0.5-40,
          child: Row(
            children: <Widget> [
              // SizedBox
              Text(mrt[0].t1,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold)),
              SizedBox(width: 15,),
              if (mrt[0].t2 !='尚未發車')
              Text(mrt[0].t2,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
class CountDown2 extends StatelessWidget {
  final List<MrtCountdown> mrt;
  CountDown2({Key key, this.mrt}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: width*0.5-40,
          child: Row(
            children: <Widget> [
              // SizedBox
              Text(mrt[0].b1,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold)),
              SizedBox(width: 15,),
              if (mrt[0].b2 !='尚未發車')
              Text(mrt[0].b2,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
class CountDown3 extends StatelessWidget {
  final List<MrtCountdown> mrt;
  CountDown3({Key key, this.mrt}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: width*0.5-40,
          child: Row(
            children: <Widget> [
              // SizedBox
              Text(mrt[0].d1,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold)),
              SizedBox(width: 15,),
              if (mrt[0].d2 !='尚未發車')
              Text(mrt[0].d2,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
class CountDown4 extends StatelessWidget {
  final List<MrtCountdown> mrt;
  CountDown4({Key key, this.mrt}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: width*0.5-40,
          child: Row(
            children: <Widget> [
              // SizedBox
              Text(mrt[0].d1,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold)),
              SizedBox(width: 15,),
              if (mrt[0].d2 !='尚未發車')
              Text(mrt[0].d2,textAlign: TextAlign.left,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20.0,color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}