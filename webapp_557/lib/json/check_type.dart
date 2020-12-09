import 'package:flutter/material.dart';
// import 'package:selection_menu/selection_menu.dart';
// import 'package:positioned_tap_detector/positioned_tap_detector.dart';

class CheckStopTime extends StatelessWidget{
  const CheckStopTime({
    Key key,
    @required this.text,
    @required this.text2,//text2存在表示是要有預估進站時間的
  }) : super(key: key);
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    if (text2 == 'None') {
      if (text == '未發車') {
        return Icon(Icons.adjust, color: Colors.grey[850]);
        // return RoadSpeedTypeWindows(colorType: Colors.grey[850],);
      }
      if (text == '進站中') {
       return Icon(Icons.adjust, color: Colors.red);
      // return RoadSpeedTypeWindows(colorType: Colors.red,);
      }
      if (text == '將到站') {
       return Icon(Icons.adjust, color: Colors.teal);
      // return RoadSpeedTypeWindows(colorType: Colors.teal,);
      }
      if (text == '末班已過') {
       return Icon(Icons.adjust, color: Colors.grey[850]);
      // return RoadSpeedTypeWindows(colorType: Colors.grey[850],);
      } else {
        return Icon(Icons.adjust, color: Colors.indigo,);
        // return RoadSpeedTypeWindows(colorType: Colors.indigo,);
      }
    } else {
      return Icon(Icons.adjust, color: Colors.purple);
    }
  }
}

class TimeBar extends StatelessWidget{
  const TimeBar({
    Key key,
    @required this.text,
    @required this.text2,//text2存在表示是要有預估進站時間的
  }) : super(key: key);
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    if (text2 == 'None') {
      if (text == '未發車') {
        return Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0));
      }
      if (text == '進站中') {
       return Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.red));//,color: Colors.teal
      }
      if (text == '將到站') {
       return Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.teal));
      }
      if (text == '末班已過') {
       return Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0));
      } else {
        return Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.indigo));
      }
    } else {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Container(
              alignment:Alignment.center,
              padding: EdgeInsets.only(top:3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.purple)),
            ),
          ),
          SizedBox(height:5), 
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Container(
              alignment:Alignment.center,
              padding: EdgeInsets.only(top:3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(text2, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.purple)),
            ),
          ),
          // Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.purple)),
          // Text(text2, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, color: Colors.purpleAccent[100])),
        ],
      );
    }
  }
}

class StationType extends StatelessWidget {
  const StationType({
    Key key,
    @required this.text,
    @required this.text2,
    @required this.station,
  }) : super(key: key);
  final String text;
  final String text2;
  final String station;
  @override  
  Widget build(BuildContext context) {
    if (text2 == 'None') {
      if (text == '進站中') {
        return Flexible(child: Text(station, style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)));
      } else {
        return Flexible(child: Text(station, style: TextStyle(fontSize: 20, color: Colors.grey)));
      }
    } else {
      return Flexible(child: Text(station, style: TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.bold)));
    }
  }
}

// class CrowdingLevel extends StatelessWidget {

// }

// class RoadSpeedTypeWindows extends StatelessWidget {
//   const RoadSpeedTypeWindows ({
//     Key key,
//     @required this.colorType,
//   }) : super(key: key);
//   final Color colorType;
//   @override
//   Widget build(BuildContext context) {
    
//     // return PopupMenuButton(
//     //   itemBuilder: (BuildContext context) => [
//     //     PopupMenuItem(
//     //       child: Row(
//     //         children: <Widget>[
//     //           Icon(Icons.check_circle, color: Colors.red),
//     //           Text('擁擠'),
//     //         ],
//     //       ),
//     //     ),
//     //   ],
//     //   child: Icon(Icons.adjust, color: Colors.red,),
//     // );
//   }
// }

class RoadSpeedType extends StatelessWidget{
  const RoadSpeedType({
    Key key,
    @required this.speed,
    @required this.time1,
    @required this.time2,
  }) : super(key: key);
  final String speed;
  final String time1;
  final String time2;
  @override
  Widget build(BuildContext context) {
    if (speed == "順暢") {
      return Container(
        // margin: EdgeInsets.only(left:10, right:10),
        width: 25,
        height: 100,
        color: Colors.green[100],
        child: CheckStopTime(text: time1, text2: time2),
      );
    }
    if (speed == "中等") {
      return Container(
        // margin: EdgeInsets.only(left:10, right:10),
        width: 25,
        height: 100,
        color: Colors.yellow[100],
        child: CheckStopTime(text: time1, text2: time2),
      );
    }
    if (speed == "壅塞") {
      return Container(
        // margin: EdgeInsets.only(left:10, right:10),
        width: 25,
        height: 100,
        color: Colors.red[100],
        child: CheckStopTime(text: time1, text2: time2),
      );
    } else {
      return Container(
        // margin: EdgeInsets.only(left:10, right:10),
        width: 25,
        height: 100,
        color: Colors.grey[200],
        child: CheckStopTime(text: time1, text2: time2),
      );
    }
  }
}

class BusCrowdingType extends StatelessWidget{
  const BusCrowdingType ({
    Key key,
    @required this.crowd,
    @required this.carNumber,
  }) : super(key: key);
  final String crowd;
  final String carNumber;
  @override
  Widget build(BuildContext context) {
    if (carNumber !='None') {
      if (crowd =='舒適(<50%)'){
        return CrowdingLevel(carNumber: carNumber, colorType: Colors.green);
      }
      if (crowd =='比較擁擠(50-70%)'){
        return CrowdingLevel(carNumber: carNumber, colorType: Colors.amberAccent);
      }
      if (crowd =='擁擠(>70%)'){
        return CrowdingLevel(carNumber: carNumber, colorType: Colors.red);
      } else {
        return CrowdingLevel(carNumber: carNumber, colorType: Colors.grey);
      }
    } else {
      return Container();
    }
  }
}

class CrowdingLevel extends StatelessWidget{
  const CrowdingLevel ({
    Key key,
    @required this.carNumber,
    @required this.colorType,
  }) : super(key: key);
  final String carNumber;
  final Color colorType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.directions_bus, color: colorType,),
        Text(carNumber, style: TextStyle(decoration: TextDecoration.underline, color: colorType,)),
      ],
    );
  }
}


