import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'header_clip.dart';


class ReservasClient extends StatelessWidget {

  static String taskName = "Reparación de Puerta Garage";

  final List<TimelineModel> items = [
    TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:FractionalOffset(0.2, 0.0),
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff257ce1),
                    Color(0xff92bdf0)
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                  "Agosto 25",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                  "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Realizada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Cancelada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          child: Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin:FractionalOffset(0.2, 0.0),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff257ce1),
                      Color(0xff92bdf0)
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height:
                        20.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Center(
                          child: Text(
                            "Programada",
                            style: TextStyle(
                              fontSize: 9.0,
                              fontFamily: "PoppinsRegular",
                              color: Color(0xff257ce1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsRegular",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Agosto 25",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 14.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Plomeria San Rafael",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "PoppinsRegular"
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          margin: EdgeInsets.only(bottom: 20.0),
          child: Stack(
            children: <Widget>[
              HeaderClip(),
              Container(
                margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 10.0),
                child: Text(
                  "Mis Reservaciones",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "PoppinsRegular",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Timeline(children: items, position: TimelinePosition.Left),
        )
      ],
    );
  }
}
