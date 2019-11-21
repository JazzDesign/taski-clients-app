import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'proveedores_list.dart';
import 'header_clip.dart';
import 'package:image_picker/image_picker.dart';

class ServiceDescription extends StatefulWidget {
  final String _categoryId;
  final String _typeOfService;
  final String _userId;

  ServiceDescription(this._userId, this._categoryId, this._typeOfService);

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

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

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
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Center(
                          child: _image == null ? Text('Seleccione una imagen') : Image.file(_image),
                        ),
                      ),
                      Center(
                        child: RaisedButton(
                          color: Color(0xff2a7de1),
                          onPressed: getImage,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Icon(
                              Icons.add_a_photo,
                            color: Colors.white,
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
                                      .collection(
                                          "categories/${widget._categoryId}/jobs")
                                      .add({
                                    'address': _addressController.text,
                                    'description': _descriptionController.text,
                                    'price': _maxPay.text,
                                    'title': _titleController.text,
                                    'scheduled': _dateTime,
                                    'consumer': widget._userId
                                  }).then((doc) {
                                    Firestore.instance
                                        .collection(
                                            "users/${widget._userId}/jobs")
                                        .add({
                                      'address': _addressController.text,
                                      'description':
                                          _descriptionController.text,
                                      'price': int.parse(_maxPay.text),
                                      'title': _titleController.text,
                                      'scheduled': _dateTime,
                                      'state': 'PENDING',
                                      'consumer': widget._userId
                                    }).then((doc2) {
                                      _showConfirmation(context);
                                    });
                                  });
                                } else {
                                  print("todo validado");
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
                                            _dateTime)),
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
}
