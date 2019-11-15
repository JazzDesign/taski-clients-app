import 'package:flutter/material.dart';
import 'package:taski_clients/service_description.dart';
import 'header_clip.dart';

class TypeServices extends StatefulWidget {
  final String _categoryId;
//  final String _typeOfService;

  TypeServices(this._categoryId);

  @override
  _TypeServicesState createState() => _TypeServicesState();
}

class _TypeServicesState extends State<TypeServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Taski",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "PoppinsRegular",
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: Wrap(
        children: <Widget>[
          Stack(
            children: <Widget>[
              HeaderClip(),
              Container(
                margin: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                child: Text(
                  "¿Qué tipo de pago por Taski servicio prefieres?",
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "PoppinsRegular",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              "Selecciona \ntipo de pago",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28.0,
                fontFamily: "PoppinsRegular",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                    height: 100,
                    width: MediaQuery.of(context).size.width/2,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      onPressed: () {
                        print("pago-fijo");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceDescription(widget._categoryId, "pago-fijo")),
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
                        );
                        },
                      color: Color(0xff2a7de1),
                      child: Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 64.0,
                                ),
                              ),
                              Text(
                                "Pago Fijo",
                                style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white
                                ),
                                maxLines: 2,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                    height: 100,
                    width: MediaQuery.of(context).size.width/2,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      onPressed: () {
                        print("pago-hora");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceDescription(widget._categoryId, "pago-hora")),
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
                        );
                      },
                      color: Color(0xff2a7de1),
                      child: Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 64.0,
                                ),
                              ),
                              Text(
                                "Pago por hora",
                                style: TextStyle(
                                    fontFamily: "PoppinsRegular",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.white
                                ),
                                maxLines: 2,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ),

        ],
      ),
    );
  }
}
