import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'proveedores_list.dart';
import 'header_clip.dart';

class ServiceDescription extends StatefulWidget {
  final String _categoryId;
  final String _typeOfService;

  ServiceDescription(this._categoryId, this._typeOfService);

  @override
  _ServiceDescriptionState createState() => _ServiceDescriptionState();
}

class _ServiceDescriptionState extends State<ServiceDescription> {
  String _date = "No Seleccionado";

  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _maxPay = TextEditingController();
  DateTime _dateTime;

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
              margin: EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                              print('confirm $date');
                              _dateTime = date;
                              _date = '${date.year} - ${date.month} - ${date.day}';
                              setState(() {});
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
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
                            style: TextStyle(fontFamily: "PoppinsRegular"),
                            keyboardType: TextInputType.number,
                            controller: _maxPay,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor ingresar dirección';
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
                        :
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
                              top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar .
                              print("todo validado");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProveedoresList(
                                        widget._categoryId,
                                        _descriptionController.text,
                                        _addressController.text,
                                        _maxPay.text,
                                        _dateTime)),
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
                              );
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text(
                            'Buscar Taski Proveedores',
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
          ],
        ),
      ),

    );
  }
}
