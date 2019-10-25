import 'package:flutter/material.dart';

class ProveedoresList extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];


  List dataList = [
    {
      "index": 0,
      "name": "Jason Chicas",
      "price": "Q240.0",
      "works": "10 tareas realizadas",
      "photo": "https://randomuser.me/portraits/men/0.jpg"
    },
    {
      "index": 1,
      "name": "Jason Chicas",
      "price": "Q200.0",
      "works": "8 tareas realizadas",
      "photo": "https://randomuser.me/portraits/men/1.jpg"
    },
    {
      "index": 2,
      "name": "Jason Chicas",
      "price": "Q180.0",
      "works": "5 tareas realizadas",
      "photo": "https://randomuser.me/portraits/men/2.jpg"
    },
    {
      "index": 3,
      "name": "Jason Chicas",
      "price": "Q1250.0",
      "works": "4 tareas realizadas",
      "photo": "https://randomuser.me/portraits/men/3.jpg"
    },
    {
      "index": 4,
      "name": "Jason Chicas",
      "price": "Q110.0",
      "works": "3 tareas realizadas",
      "photo": "https://randomuser.me/portraits/men/4.jpg"
    },
    {
      "index": 5,
      "name": "Jason Chicas",
      "price": "Q80.0",
      "works": "2 tareas realizadas",
      "photo": "https://randomuser.me/portraits/men/5.jpg"
    }
  ];



  final proveedorCard =  GestureDetector(
    onTap: () {
      print("Selecciono un proveedor");
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Container(
              padding: EdgeInsets.only(right: 12.0),
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape:  BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://randomuser.me/portraits/men/5.jpg")
                ),
                //AssetImage(pathImage))
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0,),
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Don Justo",
                          style: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        padding: EdgeInsets.only(bottom:10.0),
                        child: Text(
                          "Q240.00/hr",
                          style: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0,),
                    child: Text(
                      "3 Servicios realizados",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          color: Colors.white70,
                          fontSize: 14.0
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0,),
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(

                          child: Text(
                            "Calificación:",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12.0
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15.0,
                              right: 1.0
                          ),
                          child: Icon(
                            Icons.star,
                            size: 20.0,
                            color: Color(0xFFF2C611),
                          ),
                          width: 5.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15.0,
                              right: 1.0
                          ),
                          child: Icon(
                            Icons.star,
                            size: 20.0,
                            color: Color(0xFFF2C611),
                          ),
                          width: 5.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15.0,
                              right: 1.0
                          ),
                          child: Icon(
                            Icons.star,
                            size: 20.0,
                            color: Color(0xFFF2C611),
                          ),
                          width: 5.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15.0,
                              right: 1.0
                          ),
                          child: Icon(
                            Icons.star,
                            size: 20.0,
                            color: Color(0xFFF2C611),
                          ),
                          width: 5.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15.0,
                              right: 1.0
                          ),
                          child: Icon(
                            Icons.star_half,
                            size: 20.0,
                            color: Color(0xFFF2C611),
                          ),
                          width: 5.0,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),

        ],
      ),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Proveedores",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
              child: Text(
                "Taski Proveedores",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: "PoppinsRegular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: ListView(
              children: <Widget>[
              Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: proveedorCard,
                  ),
                ),
              ],
            ),),
          ],
        ));
  }
}
