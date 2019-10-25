import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:taski_clients/service_description.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'service_description.dart';

class ClientMenu extends StatefulWidget {
  @override
  _ClientMenuState createState() => _ClientMenuState();
}

//Cambiar por data que venga de Firebase
String clientName = "Json";

final List<String> _listViewData = [
  "Plomería",
  "Jardinería",
  "Electricista",
  "Pintura",
];

final List<TimelineModel> items = [
  TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("Reservacion 1"),
            ],
          ),
        ),
      ),
      position: TimelineItemPosition.random,
      iconBackground: Color(0xff2a7de1),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      )),
  TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("Reservacion 2"),
            ],
          ),
        ),
      ),
      position: TimelineItemPosition.random,
      iconBackground: Color(0xff2a7de1),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      )),
  TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("Reservacion 3"),
            ],
          ),
        ),
      ),
      position: TimelineItemPosition.random,
      iconBackground: Color(0xff2a7de1),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      )),
  TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("Reservacion 4"),
            ],
          ),
        ),
      ),
      position: TimelineItemPosition.random,
      iconBackground: Color(0xff2a7de1),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      )),
  TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("Reservacion 5"),
            ],
          ),
        ),
      ),
      position: TimelineItemPosition.random,
      iconBackground: Color(0xff2a7de1),
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      )),
];

class _ClientMenuState extends State<ClientMenu> {
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'home',
        title: 'Inicio',
        icon: Icons.home,
      ),
      new MenuItem(
        id: 'reservas',
        title: 'Mis Reservas',
        icon: Icons.assignment,
      ),
      new MenuItem(
        id: 'notificaciones',
        title: 'Notificaciones',
        icon: Icons.notifications_none,
      ),
      new MenuItem(
        id: 'perfil',
        title: 'Mi perfil',
        icon: Icons.person,
      ),
      new MenuItem(
        id: 'direcciones',
        title: 'Mis Direcciones',
        icon: Icons.room,
      ),
      new MenuItem(
        id: 'pagos',
        title: 'Método de Pago',
        icon: Icons.payment,
      ),
      new MenuItem(
        id: 'logout',
        title: 'Cerrar Sesión',
        icon: Icons.power_settings_new,
      ),
    ],
  );

  var selectedMenuItemId = 'reservas';

  final reservas = Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
        child: Text(
          "Mis Reservaciones",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 40.0,
            fontFamily: "PoppinsRegular",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Timeline(children: items, position: TimelinePosition.Left),
      )
    ],
  );


  Widget homePage() {
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

  Widget _widget;

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: <Widget>[
              new Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/json.jpg")))),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "JsonChicas",
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        "rabelyj@gmail.com",
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DrawerScaffold(
        percentage: 0.6,
        appBar: AppBarProps(
            title: Text(
              "Taski",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "PoppinsRegular",
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})
            ]),
        menuView: new MenuView(
          menu: menu,
          headerView: headerView(context),
          animation: true,
          color: Colors.white,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (String itemId) {
            selectedMenuItemId = itemId;
            if (itemId == 'home') {
              setState(() => _widget = homePage());
              // Navigator.pushNamed(context, '/home');
            } else if (itemId == 'reservas') {
              setState(() => _widget = reservas);
            }
          },
        ),
        contentView: Screen(
          contentBuilder: (context) => Scaffold(
            body: _widget,
          ),
          color: Colors.white,
        ));
  }
}
