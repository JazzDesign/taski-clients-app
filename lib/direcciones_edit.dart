import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'header_clip.dart';


class DireccionesEdit extends StatefulWidget {
  final String _addressId;
  final String _userId;

  DireccionesEdit(this._userId, this._addressId);

  @override
  _DireccionesEditState createState() => _DireccionesEditState();
}

class _DireccionesEditState extends State<DireccionesEdit> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  String userName = "";
  String userEmail = "";


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
      body: Container(
        child: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                HeaderClip(),
                Container(
                  margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                  child: Text(
                    "Edita tu dirección",
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
              margin: EdgeInsets.only(top: 200.0, right: 20.0, left: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "Datos de tu dirección:",
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
                                  "Editar",
                                  style: TextStyle(
                                      fontFamily: "PoppinsRegular",
                                      color: Colors.white
                                  ),
                                ),
                                onPressed: () {

                                  if (_formKey.currentState.validate()) {
                                    print("HOLA");
                                    Firestore.instance
                                        .collection("users/${widget._userId}/address")
                                        .document(widget._addressId)
                                        .setData({
                                      'name': _nameController.text,
                                      'address': _descriptionController.text
                                    }, merge: true);
                                  }
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
