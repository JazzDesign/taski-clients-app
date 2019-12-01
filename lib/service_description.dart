import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'proveedores_list.dart';
import 'header_clip.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ServiceDescription extends StatefulWidget {
  final String _categoryId;
  final String _typeOfService;
  final String _userId;
  final DocumentSnapshot jobDocument;

  ServiceDescription(this._userId, this._categoryId, this._typeOfService,
      {this.jobDocument});

  @override
  _ServiceDescriptionState createState() => _ServiceDescriptionState();
}

class _ServiceDescriptionState extends State<ServiceDescription> {
  String _date = "No Seleccionado";

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _maxPay = TextEditingController();
  final _totalHours = TextEditingController();
  DateTime _dateTime;

  List<File> photos = [];
  List<String> photosUris = [];
  bool _loadingPhoto = false;
  bool _photoUploaded = false;

  Future _getImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      photos.add(image);
    });
    await uploadPic(context, image);
  }

  Future uploadPic(BuildContext context, File image) async {
    String fileName = basename(image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    setState(() {
      _photoUploaded = false;
      _loadingPhoto = true;
    });
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    print("Profile Picture uploaded");
    print("Fotos = $url");
    photosUris.add(url);
    setState(() {
      _loadingPhoto = false;
      _photoUploaded = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.jobDocument != null) {
      _titleController.text = widget.jobDocument['title'];
      _descriptionController.text = widget.jobDocument['description'];
      _addressController.text = widget.jobDocument['address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
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
                    "Describe el Taski servicio que necesitas",
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
              margin: EdgeInsets.only(top: 180.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Título del Taski Servicio:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontFamily: "PoppinsRegular"),
                          controller: _titleController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingresar título del Taski servicio';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Arreglo de Jardín',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Descripción del Taski Servicio:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontFamily: "PoppinsRegular"),
                          controller: _descriptionController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingresar descripción del Taski servicio';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Hola, necesito corte de mi jardín.',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Dirección para el Taski servicio:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontFamily: "PoppinsRegular"),
                          controller: _addressController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingresar dirección';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: '4 Calle A 7av. zona 10',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Fecha para realizar el Taski servicio:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: DateTime(2000, 1, 1),
                              maxTime: DateTime(2022, 12, 31),
                              onConfirm: (date) {
                            print('confirm $date');
                            _dateTime = date;
                            _date =
                                '${date.year} - ${date.month} - ${date.day}';
                            setState(() {});
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 18.0,
                                          color: Colors.teal,
                                        ),
                                        Text(
                                          " $_date",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "  Cambiar",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: deviceSize.height / 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Fotos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: photos.isEmpty
                                      ? Row(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text("No tienes fotos aun"),
                                          )
                                        ])
                                      : ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: photos.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.file(photos[index]),
                                          ),
                                        ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  RaisedButton(
                                    color: Color(0xff2a7de1),
                                    onPressed: () => _getImage(context),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    child: Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(_loadingPhoto
                                        ? 'Subiendo foto...'
                                        : (_photoUploaded
                                            ? 'Foto subida correctamente'
                                            : '')),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      widget._typeOfService == 'pago-fijo'
                          ? new Wrap(
                              children: <Widget>[
                                Text(
                                  "Ingrese monto máximo a pagar:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    fontFamily: 'PoppinsRegular',
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: TextFormField(
                                    style:
                                        TextStyle(fontFamily: "PoppinsRegular"),
                                    keyboardType: TextInputType.number,
                                    controller: _maxPay,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Por favor ingresar monto maximo';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Q150',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'PoppinsRegular',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : new Wrap(
                              children: <Widget>[
                                Text(
                                  "Ingrese cantidad de Hrs:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    fontFamily: 'PoppinsRegular',
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: TextFormField(
                                    style:
                                        TextStyle(fontFamily: "PoppinsRegular"),
                                    keyboardType: TextInputType.number,
                                    controller: _totalHours,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Por favor ingresar cantidad de horas';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: '3',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'PoppinsRegular',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xff2a7de1),
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 20.0,
                                left: 20.0,
                                bottom: 20.0),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
//                              if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar .
                              if (widget._typeOfService == "pago-fijo") {
                                // La agregamos al pool
                                print(widget._typeOfService);

                                Firestore.instance
                                    .collection("users/${widget._userId}/jobs")
                                    .add({
                                  'address': _addressController.text,
                                  'description': _descriptionController.text,
                                  'categoryId': widget._categoryId,
                                  'price': int.parse(_maxPay.text),
                                  'title': _titleController.text,
                                  'scheduled': _dateTime,
                                  'state': 'PENDING',
                                  'consumer': widget._userId,
                                  'photos': photosUris
                                }).then((doc2) {
                                  Firestore.instance
                                      .collection(
                                          "categories/${widget._categoryId}/jobs")
                                      .add({
                                    'address': _addressController.text,
                                    'description': _descriptionController.text,
                                    'price': int.parse(_maxPay.text),
                                    'title': _titleController.text,
                                    'scheduled': _dateTime,
                                    'consumer': widget._userId,
                                    'consumerJob': doc2.documentID,
                                    'photos': photosUris
                                  }).then((doc) {
                                    _showConfirmation(context);
                                  });
                                });
                              }
                              if (widget.jobDocument != null) {
                                final int totalHours =
                                    int.parse(_totalHours.text);
                                Firestore.instance
                                    .collection("users")
                                    .document(widget.jobDocument['provider'])
                                    .get()
                                    .then((provider) {
                                  final int hourCharge =
                                      int.parse(provider['hour_charge']);
                                  Firestore.instance
                                      .collection(
                                          "users/${widget._userId}/jobs")
                                      .add({
                                    'address': _addressController.text,
                                    'description': _descriptionController.text,
                                    'price': totalHours * hourCharge,
                                    'title': _titleController.text,
                                    'scheduled': _dateTime,
                                    'consumer': widget._userId,
                                    'provider': widget.jobDocument['provider'],
                                    'photos': photosUris,
                                    'state': 'PENDING'
                                  }).then((doc) {
                                    Firestore.instance
                                        .collection(
                                            "users/${widget.jobDocument['provider']}/jobs")
                                        .add({
                                      'address': _addressController.text,
                                      'description':
                                          _descriptionController.text,
                                      'price': totalHours * hourCharge,
                                      'title': _titleController.text,
                                      'scheduled': _dateTime,
                                      'consumer': widget._userId,
                                      'provider':
                                          widget.jobDocument['provider'],
                                      'consumerJob': doc.documentID,
                                      'photos': photosUris,
                                      'state': 'PENDING'
                                    }).then((doc2) {
                                      _showConfirmation(context);
                                    });
                                  });
                                });
                              } else {
                                print("todo validado");
                                print("Fotos = $photosUris");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProveedoresList(
                                          widget._userId,
                                          widget._categoryId,
                                          _titleController.text,
                                          _descriptionController.text,
                                          _addressController.text,
                                          _totalHours.text,
                                          _dateTime,
                                          photosUris)),
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
                                );
//                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              widget._typeOfService == "pago-fijo"
                                  ? "Crear Tarea"
                                  : (widget.jobDocument != null)
                                      ? 'Crear'
                                      : 'Buscar Taski Proveedores',
                              style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                  'Te notificaremos cuando un proveedor decida tomarla.',
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
}
