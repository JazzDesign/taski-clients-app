import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';

class ClientMenu extends StatefulWidget {
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
  var _widget = Text("HOME");



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
                        style: TextStyle(fontFamily: 'PoppinsRegular', fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "rabelyj@gmail.com",
                        style: TextStyle(fontFamily: 'PoppinsRegular', fontWeight: FontWeight.normal, fontSize: 16),
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
            title: Text("10 av. Zona 10 Boca del Monte"),
            actions: [IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})]),
        menuView: new MenuView(
          menu: menu,
          headerView: headerView(context),
          animation: true,
          color: Colors.white,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (String itemId) {
            selectedMenuItemId = itemId;
            if (itemId == 'home') {
              setState(() => _widget = Text("HOME"));
            } else {
              setState(() => _widget = Text("default"));
            }
          },
        ),
        contentView: Screen(
          contentBuilder: (context) => LayoutBuilder(
            builder: (context, constraint) => GestureDetector(
              child: Container(
                color: Colors.white,
                width: constraint.maxWidth,
                height: constraint.maxHeight,
                child: Center(child: _widget),
              ),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Clicked"),
                  duration: Duration(seconds: 3),
                ));
              },
            ),
          ),
          color: Colors.white,
        ));
  }
}