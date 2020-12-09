import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:webapp_557/json/check_type.dart';


class BusDetail extends StatefulWidget {
  @override
  BusDetail1State createState() => new BusDetail1State();
}

class BusDetail1State extends State<BusDetail> {
  List data;
  Future getData() {
    return DefaultAssetBundle.of(context).loadString('assets/bus_detail_back.json');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: getData(),
                // future: DefaultAssetBundle.of(context)
                //     .loadString('assets/bus_detail_go.json'),
                builder: (context, snapshot) {
                  List<CarNoDetail> countries =
                      parseJosn(snapshot.data.toString());
                  return countries.isNotEmpty
                      ? new CountyList1(countdown: countries)
                      : new Center(child: new CircularProgressIndicator());
                }),
          ),
        );
  }

  List<CarNoDetail> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<CarNoDetail>((json) => new CarNoDetail.fromJson(json)).toList();
  }
}

class CarNoDetail {
  final String name;
  final String countDown;
  final String countDown2;
  final String carNumber;
  final String way;
  final String roadType;
  final String crowding;

  CarNoDetail({
    this.name,
    this.countDown,
    this.countDown2,
    this.carNumber,
    this.way,
    this.roadType,
    this.crowding,
  });

  factory CarNoDetail.fromJson(Map<String, dynamic> json) {
    return new CarNoDetail(
      name: json['name'] as String,
      countDown: json['countDown'] as String,
      countDown2: json['countDown2'] as String,
      carNumber: json['carNo'] as String,
      way: json['way'] as String,
      roadType: json['roadType'] as String,
      crowding: json['crowding'] as String,
    );
  }

}

class MrtCountdown {
  final String t1;
  final String t2;
  final String d1;
  final String d2;
  final String b1;
  final String b2;
  final String x1;
  final String x2;
  MrtCountdown({
    this.t1,
    this.t2,
    this.b1,
    this.b2,
    this.d1,
    this.d2,
    this.x1,
    this.x2,
  });
  factory MrtCountdown.fromJson(Map<String, dynamic> json) {
    return MrtCountdown(
      t1: json['Tamsui1'] as String,
      t2: json['Tamsui2'] as String,
      b1: json['Beitou1'] as String,
      b2: json['Beitou2'] as String,
      x1: json['Xiangshan1'] as String,
      x2: json['Xiangshan2'] as String,
      d1: json['Daan1'] as String,
      d2: json['Daan2'] as String,
    );
  }
}

class CountyList1 extends StatelessWidget {
  final List<CarNoDetail> countdown;
  CountyList1({Key key, this.countdown}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView.builder(
        itemCount: countdown == null ? 0 : countdown.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width:10),
                SizedBox(
                  width:80,
                  child: TimeBar(text: countdown[index].countDown, text2: countdown[index].countDown2),//倒數時間
                ),
                // TimeBar(text: countdown[index].countDown, text2: countdown[index].countDown2),
                Container(
                  margin: EdgeInsets.only(left:10),
                  width: 3,
                  height: 100,
                  color: Colors.deepPurple[300],
                ),
                RoadSpeedType(speed: countdown[index].roadType, time1: countdown[index].countDown, time2: countdown[index].countDown2),
                Container(
                  margin: EdgeInsets.only(right:10),
                  width: 3,
                  height: 100,
                  color: Colors.deepPurple[300],
                ),
                StationType(text: countdown[index].countDown, text2: countdown[index].countDown2, station: countdown[index].name),//站名
                BusCrowdingType(crowd: countdown[index].crowding, carNumber: countdown[index].carNumber),
              ],
            ),
          );
        }
      ),
    );
  }
}