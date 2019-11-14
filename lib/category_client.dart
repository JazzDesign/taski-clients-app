import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'service_description.dart';
import 'promotions.dart';

class CategoryClient extends StatefulWidget {
  final String _userName;
  final String _userEmail;
  CategoryClient(this._userName, this._userEmail);

  //Cambiar por data que venga de Firebase
  @override
  _CategoryClientState createState() => _CategoryClientState();
}



class HeaderClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height-50);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width/2, size.height);

    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}

class _CategoryClientState extends State<CategoryClient> {
  String clientName = "";

  List<DocumentSnapshot> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Firestore.instance.collection("categories").snapshots().listen((snapshot) {
      setState(() {
        categories = snapshot.documents;
      });
    });

    clientName = widget._userName;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Nuestros \nTaski Servicios",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: "PoppinsRegular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
                      height: 300.0,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: categories.map((document) {
                          return GestureDetector(
                            onTap: () {
                              print("Se hizo Click en Pintura");
                              Navigator.push(
                                context,
//                      MaterialPageRoute(builder: (context) => ProveedoresList()),
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ServiceDescription(document.documentID)),
                              );
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 1.0,
                                          spreadRadius: -1.0,
                                          color: Color(0x33000000)),
                                      BoxShadow(
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 1.0,
                                          spreadRadius: 0.0,
                                          color: Color(0x33000000)),
                                      BoxShadow(
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 3.0,
                                          spreadRadius: 0.0,
                                          color: Color(0x33000000)),
                                    ]),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                                      width: 54.0,
                                      height: 54.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  document['icon'].toString()))),
                                    ),
                                    Text(
                                      document['description'].toString(),
                                      style: TextStyle(
                                          fontFamily: "PoppinsRegular",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          );
                        }).toList(),

                        /*GestureDetector(
                  onTap: () {
                    print("Se hizo Click en Reparaciones");
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: -1.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                          ]),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            width: 64.0,
                            height: 64.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/icons/repair-icon.png"))),
                          ),
                          Text(
                            'Reparaciones',
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print("Se hizo Click en Electricidad");
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: -1.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                          ]),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            width: 64.0,
                            height: 64.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/icons/luz-icon.png"))),
                          ),
                          Text(
                            'Electricidad',
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print("Se hizo Click en Carpintería");
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: -1.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                          ]),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            width: 64.0,
                            height: 64.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/icons/carpinteria-icon.png"))),
                          ),
                          Text(
                            'Carpintería',
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print("Se hizo Click en Plomería");
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: -1.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                          ]),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            width: 64.0,
                            height: 64.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/icons/plomeria-icon.png"))),
                          ),
                          Text(
                            'Plomería',
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print("Se hizo Click en Jardinería");
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: -1.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 0.0,
                                color: Color(0x33000000)),
                          ]),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            width: 64.0,
                            height: 64.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/icons/jardin-icon.png"))),
                          ),
                          Text(
                            'Jardinería',
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ],*/
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
//        width: 100.0,
                    child: Text(
                      "Promociones",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: "PoppinsRegular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Promotions(),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
//        width: 100.0,
                    child: Text(
                      "Promociones",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: "PoppinsRegular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: HeaderClip(),
                  child: Container(
                    height: 180.00,
                    decoration: BoxDecoration(
                      color: Color(0xff2a7de1),
                    ),
                  ) ,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
                  child: Text(
                    "Hola, $clientName",
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
          ],
        ),
      ],
    );
  }
}
