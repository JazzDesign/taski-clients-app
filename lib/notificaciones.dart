import 'package:flutter/material.dart';
import 'header_clip.dart';

class Notificaciones extends StatefulWidget {
  @override
  _NotificacionesState createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            HeaderClip(),
            Container(
              margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              child: Text(
                "Notificaciones",
                textAlign: TextAlign.left,
                maxLines: 2,
                softWrap: true,
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
        Container(
          margin: EdgeInsets.only(top: 200.0, right: 20.0, left: 20.0),
          child: Text("Contenido") ,
        ),
      ],
    );
  }
}
