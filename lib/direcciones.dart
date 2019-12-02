import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'direcciones_edit.dart';
import 'header_clip.dart';

class Direcciones extends StatefulWidget {
  DocumentSnapshot user;
  String userId;


  Direcciones(this.userId);

  @override
  _DireccionesState createState() => _DireccionesState();
}



class _DireccionesState extends State<Direcciones> {
  String userName = "";
  String userEmail = "";



  void _settingModalBottomSheet(context){
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
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
                          "Agrega una nueva dirección:",
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
                            Icons.gesture,
                          ),
                          hintText: 'Ingresa nombre de tu dirección',
                          hintStyle: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.black
                          ),
                          labelText: 'Nombre',
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
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(
                            Icons.map,
                          ),
                          hintText: 'Ingresa tu dirección',
                          hintStyle: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.black
                          ),
                          labelText: 'Dirección',
                          labelStyle: TextStyle(
                              fontFamily: "PoppinsRegular"
                          ),
                        ),
                        controller: _descriptionController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor ingresar dirección';
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
                                    'users/${widget.userId}/address')
                                    .add({
                                  'address': _descriptionController.text,
                                  'name': _nameController.text
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
              child: Icon(Icons.home, color: Colors.white),
            ),
            title: Text(
                "${document['name']}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text("${document['address']}",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onTap: () {
              print("Ver mas");
              print(document.documentID);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DireccionesEdit(widget.userId, document.documentID),)
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
              );
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
                margin: EdgeInsets.only(top: 200.0),
                child: Text(
                  "Direcciones Guardadas",
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
                      .collection('users/${widget.userId}/address')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Cargando...');
                    if (snapshot.data.documents.isEmpty) {
                      return Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                                'images/no-address.png',
                              width: 300,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                                'No tienes direcciones guardadas, agrega una dirección',
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
                        "Agregar Dirección Nueva",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                      onTap: () {
                        print("Se agregará una nueva dirección");
                        _settingModalBottomSheet(context);
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
                "Mis Direcciones",
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
