import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class ReservasClient extends StatelessWidget {

  final List<TimelineModel> items = [
    TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Reservacion 1"),
              ],
            ),
          ),
        ),
        position: TimelineItemPosition.random,
        iconBackground: Color(0xff2a7de1),
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        )),
    TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Reservacion 2"),
              ],
            ),
          ),
        ),
        position: TimelineItemPosition.random,
        iconBackground: Color(0xff2a7de1),
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        )),
    TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Reservacion 3"),
              ],
            ),
          ),
        ),
        position: TimelineItemPosition.random,
        iconBackground: Color(0xff2a7de1),
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        )),
    TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Reservacion 4"),
              ],
            ),
          ),
        ),
        position: TimelineItemPosition.random,
        iconBackground: Color(0xff2a7de1),
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        )),
    TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Reservacion 5"),
              ],
            ),
          ),
        ),
        position: TimelineItemPosition.random,
        iconBackground: Color(0xff2a7de1),
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        )),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
          child: Text(
            "Mis Reservaciones",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: "PoppinsRegular",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Timeline(children: items, position: TimelinePosition.Left),
        )
      ],
    );
  }
}
