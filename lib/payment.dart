import 'package:flutter/material.dart';
import 'header_clip.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 200.0),
                child: Text(
                  "Métodos de Pago Guardados",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "PoppinsRegular",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                color: Colors.transparent,
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff2a7de1), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 2.0, color: Colors.white24))),
                      child: Icon(Icons.payment, color: Colors.white),
                    ),
                    title: Text(
                      "***** 9022",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    trailing:
                    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                    onTap: () {
                      print("Ver mas");
                    },
                  ),
                ),
              ),
              Card(
                color: Colors.transparent,
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xff2a7de1), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 2.0, color: Colors.white24))),
                      child: Icon(Icons.payment, color: Colors.white),
                    ),
                    title: Text(
                      "***** 1340",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    trailing:
                    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                    onTap: () {
                      print("Ver mas");
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Card(
                  color: Colors.transparent,
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(width: 2.0, color: Colors.white24))),
                        child: Icon(Icons.add_circle_outline, color: Colors.white),
                      ),
                      title: Text(
                        "Agregar Nuevo Método de Pago",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                      onTap: () {
                        print("Ver mas");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Stack(
          children: <Widget>[
            HeaderClip(),
            Container(
              margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              child: Text(
                "Métodos de Pago",
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
      ],
    );
  }
}
