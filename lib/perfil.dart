import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'header_clip.dart';
import 'package:path/path.dart';

class Perfil extends StatefulWidget {
  final String _userId;
  final String _userEmail;
  final String _userName;
  final String _userPicture;
  Perfil(this._userId, this._userName, this._userEmail, this._userPicture);
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  File _image;
  String downloadUrl = "";
  bool _isLoading = false;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });

  }

  Future uploadButton(BuildContext context) async {

    setState(() {
      _isLoading = true;
    });
    await uploadPic(context, _image);

    await Firestore.instance
        .collection("users")
        .document(widget._userId)
        .setData({
      'picture': downloadUrl
    }, merge: true);

  }

  Future uploadPic(BuildContext context, File image) async {
    String fileName = basename(image.path);
    StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    print("Profile Picture uploaded");


    setState(() {
      downloadUrl = url.toString();
      _isLoading = false;
    });
  }

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
                      decoration: widget._userPicture != "" ? BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: _image == null ? NetworkImage(widget._userPicture) : FileImage(_image))
                      ) : BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: _image == null ? AssetImage("images/default-user.png") : FileImage(_image))
                      ) ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                        color: Color(0xff2a7de1),
                        onPressed: () => getImage(),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(30.0)),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
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
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            width: 32,
                            height: 32,
                            child: _isLoading
                                ? Center(child: CircularProgressIndicator())
                                : SizedBox(),
                          ),
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

                                  uploadButton(context);
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
