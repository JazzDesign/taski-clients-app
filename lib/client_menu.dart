import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:taski_clients/service_description.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'service_description.dart';
import 'reservas_client.dart';
import 'category_client.dart';

class ClientMenu extends StatefulWidget {
  final String _userId;

  ClientMenu(this._userId);

  @override
  _ClientMenuState createState() => _ClientMenuState();
}

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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

  var selectedMenuItemId = 'home';
  DocumentSnapshot user;
  String userName = "";
  String userEmail = "";

  Widget _widget = CategoryClient("", "");

  Widget headerView(DocumentSnapshot user, BuildContext context) {
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
                        user != null ? user['name'] : "",
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        user != null ? user['email'] : "",
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance
        .collection("users")
        .document(widget._userId)
        .snapshots()
        .listen((document) {
      setState(() {
        user = document;
        userName = document['name'];
        userEmail = document['email'];
        _widget = CategoryClient(userName, userEmail);
        print("name = $userName");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return user != null? new DrawerScaffold(
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
          headerView: headerView(user, context),
          animation: true,
          color: Colors.white,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (String itemId) {
            selectedMenuItemId = itemId;
            if (itemId == 'home') {
              setState(() => _widget = CategoryClient(userName, userEmail));
              // Navigator.pushNamed(context, '/home');
            } else if (itemId == 'reservas') {
              setState(() => _widget = ReservasClient());
            }
          },
        ),
        contentView: Screen(
                contentBuilder: (context) => Scaffold(
                  body: _widget,
                ),
                color: Colors.white,
              )) : Container();
  }
}
