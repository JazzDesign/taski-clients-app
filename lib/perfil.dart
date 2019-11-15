import 'package:flutter/material.dart';
import 'header_clip.dart';

class Perfil extends StatefulWidget {
  final String _userEmail;
  final String _userName;
  Perfil(this._userName, this._userEmail);
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                "Mi Perfil",
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                      width: 124.0,
                      height: 124.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/json.jpg")))),
                ),
                Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: <Widget>[
                        TextFormField(
                          enabled: false,
                          decoration: const InputDecoration(
                            icon: const Icon(
                                Icons.person,
                            ),
                            hintText: 'Ingresa Tu Nombre',
                            hintStyle: TextStyle(
                              fontFamily: "PoppinsRegular",
                              color: Colors.black
                            ),
                            labelText: 'Nombre',
                            labelStyle: TextStyle(
                              fontFamily: "PoppinsRegular"
                            ),
                          ),
                          initialValue: widget._userName,
                        ),
                        TextFormField(
                          enabled: false,
                          initialValue: widget._userEmail,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.email),
                            hintText: 'Ingresa Tu Email',
                            hintStyle: TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.black
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: "PoppinsRegular"
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Center(
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color(0xff2a7de1),
                              padding: const EdgeInsets.only(
                                  top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
                              onPressed: () {
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar .
                                  print("todo validado");
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)),
                              child: Text(
                                'Guardar',
                                style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
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
          ),
        ),
      ],
    );
  }
}
