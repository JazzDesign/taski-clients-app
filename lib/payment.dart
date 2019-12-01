import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'header_clip.dart';

class Payment extends StatefulWidget {
  DocumentSnapshot user;
  String userId;


  Payment(this.userId);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {


  void _settingModalBottomSheet(context){
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _numberController = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Container(
              padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Agrega método de pago:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.payment,
                          ),
                          hintText: 'Ingrese número de tarjeta',
                          hintStyle: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.black
                          ),
                          labelText: 'Número de tarjeta',
                          labelStyle: TextStyle(
                              fontFamily: "PoppinsRegular"
                          ),
                        ),
                        controller: _numberController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingresar número';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.gesture,
                          ),
                          hintText: 'Ingresa nombre que aparece en tarjeta',
                          hintStyle: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.black
                          ),
                          labelText: 'Nombre de tarjeta',
                          labelStyle: TextStyle(
                              fontFamily: "PoppinsRegular"
                          ),
                        ),
                        controller: _nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingresar nombre';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            textColor: Colors.white,
                            color: Color(0xff2a7de1),
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 20.0,
                                left: 20.0,
                                bottom: 20.0),
                            child: Text(
                              "Agregar",
                              style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  color: Colors.white
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {

                                Firestore.instance
                                    .collection(
                                    'users/${widget.userId}/payment')
                                    .add({
                                  'cardNumber': _numberController.text,
                                  'cardName': _nameController.text
                                });
                                print("Se Agregó");
                                Navigator.of(context).pop();
                              }

                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _buildListItem(
      BuildContext context, DocumentSnapshot document) {
    var children = <Widget>[];
    children.add(GestureDetector(
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        margin: new EdgeInsets.symmetric(vertical: 6.0),
        child:
        Container(
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
              "**** **** ****  ${document['cardNumber'].toString().substring(12)}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text("${document['cardName']}",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onTap: () {
              print("Ver mas");
            },
          ),
        ),
      ),
      onTap: () {
      },
    ));
    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 200.0, bottom: 20.0),
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
              Container(
                height: MediaQuery.of(context).size.height - 425.0,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('users/${widget.userId}/payment')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Cargando...');
                    if (snapshot.data.documents.isEmpty) {
                      return Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                                'images/no-payment.png',
                              width: 300,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              'No tienes métodos de pago ingresados, agrega un nuevo método de pago.',
                              style: TextStyle(
                                fontFamily: "PoppinsRegular",
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return _buildListItem(
                                context, snapshot.data.documents[index]);
                          });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0.0,
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
                        "Agregar método de pago",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                      onTap: () {
                        _settingModalBottomSheet(context);
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
