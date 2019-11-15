import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:taski_clients/service_description.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'service_description.dart';
import 'reservas_client.dart';
import 'category_client.dart';
import 'services/authentication.dart';
import 'notificaciones.dart';
import 'perfil.dart';
import 'direcciones.dart';
import 'payment.dart';

class ClientMenu extends StatefulWidget {
  final String _userId;
  final VoidCallback onSignedOut;
  final BaseAuth auth;

  ClientMenu(this._userId, this.auth, this.onSignedOut);

  @override
  _ClientMenuState createState() => _ClientMenuState();
}



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
    return user != null
        ? new DrawerScaffold(
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
                  IconButton(
                      icon: Icon(Icons.notifications_none), onPressed: () {})
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
                } else if (itemId == 'notificaciones') {
                  setState(() => _widget = Notificaciones());
                } else if (itemId == 'perfil') {
                  setState(() => _widget = Perfil());
                } else if (itemId == 'direcciones') {
                  setState(() => _widget = Direcciones());
                } else if (itemId == 'pagos') {
                  setState(() => _widget = Payment());
                } else if (itemId == 'logout') {
                  widget.auth.signOut();
                  widget.onSignedOut();
                }
              },
            ),
            contentView: Screen(
              contentBuilder: (context) => Scaffold(
                body: _widget,
              ),
              color: Colors.white,
            ))
        : Container();
  }
}
