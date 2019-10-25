import 'package:flutter/material.dart';
import 'service_description.dart';

class CategoryClient extends StatelessWidget {

  //Cambiar por data que venga de Firebase
  String clientName = "Json";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        //TODO : Implementar shape de decoracion
        Container(
          margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
          child: Text(
            "Hola, $clientName",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: "PoppinsRegular",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
//        width: 100.0,
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
            height: 400.0,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("Se hizo Click en Pintura");
                    Navigator.push(
                      context,
//                      MaterialPageRoute(builder: (context) => ProveedoresList()),
                      MaterialPageRoute(
                          builder: (context) => ServiceDescription()),
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
                            width: 64.0,
                            height: 64.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/icons/paint-icon.png"))),
                          ),
                          Text(
                            'Pintura',
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
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
              ],
            ))
      ],
    );
  }
}
