import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'header_clip.dart';

class ProveedoresList extends StatefulWidget {
  final String _categoryId;
  final String _description;
  final String _address;
  final String _maxPay;
  final DateTime _date;

  ProveedoresList(
      this._categoryId, this._description, this._address, this._maxPay, this._date);

  @override
  _ProveedoresListState createState() => _ProveedoresListState();
}

class _ProveedoresListState extends State<ProveedoresList> {
  final List<String> entries = <String>['A', 'B', 'C'];

  final List<int> colorCodes = <int>[600, 500, 100];

  List<DocumentSnapshot> providers = [];

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Category = ${widget._categoryId}");
    Firestore.instance
        .collection("users")
        .where("userType", isEqualTo: "provider")
        .where("category", isEqualTo: widget._categoryId)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        providers = snapshot.documents;
        print("Providers = ${providers.length}");
      });
    });
  }

  Future<void> _showConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Felicidades!',
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Tu tarea ha sido calendarizada.',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'El proveedor en unos momentos la aprobara.',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Entendido'),
              onPressed: () {
                Navigator.of(context).popUntil((route) {
                  return route.isFirst;
                });
              },
            ),
          ],
        );
      },
    );
  }

  Widget proveedorCard(BuildContext context, DocumentSnapshot document) {
    return GestureDetector(
      onTap: () {
        print("Selecciono un proveedor");
        Firestore.instance.collection("users/${document.documentID}/jobs").add({
          'title': widget._description,
          'state': 'PENDING',
          'address': widget._address,
          'scheduled': widget._date
        }).then((document) {
          _showConfirmation(context);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Container(
                padding: EdgeInsets.only(right: 12.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(document['logo'].toString())),
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
                          margin: EdgeInsets.only(
                            left: 20.0,
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            document['company'],
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Q240.00/hr",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Text(
                        "3 Servicios realizados",
                        style: TextStyle(
                            fontFamily: "PoppinsRegular",
                            color: Colors.white70,
                            fontSize: 14.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20.0,
                      ),
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
                                  fontSize: 12.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 1.0),
                            child: Icon(
                              Icons.star,
                              size: 20.0,
                              color: Color(0xFFF2C611),
                            ),
                            width: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 1.0),
                            child: Icon(
                              Icons.star,
                              size: 20.0,
                              color: Color(0xFFF2C611),
                            ),
                            width: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 1.0),
                            child: Icon(
                              Icons.star,
                              size: 20.0,
                              color: Color(0xFFF2C611),
                            ),
                            width: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 1.0),
                            child: Icon(
                              Icons.star,
                              size: 20.0,
                              color: Color(0xFFF2C611),
                            ),
                            width: 5.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 1.0),
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
  }

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
          elevation: 0.0,
        ),
        body: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              HeaderClip(),
              Container(
                margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child: Text(
                  "Taski Proveedores",
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
          Expanded(
              child: ListView(
            children: providers.map((document) {
              return Card(
                color: Colors.transparent,
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff2a7de1),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: proveedorCard(context, document),
                ),
              );
            }).toList(),
          ))
        ]));
  }
}
