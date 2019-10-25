import 'package:flutter/material.dart';

class ProveedoresList extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Container(

            width: 60.0,
            height: 60.0,

            decoration: BoxDecoration(
              shape:  BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/json.jpg")
              ),
              //AssetImage(pathImage))
            )
        ),
      ),
      title: Text(
        "Pinturas el Json",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Text(" 3 Servicios similares | Q.20.00 /hr", style: TextStyle(color: Colors.white)),
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Proveedores"),
        ),
        body: Wrap(
          children: <Widget>[
//         Container(
//           child: RaisedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Go back!'),
//           ),
//         ),
            Container(
              margin: EdgeInsets.only(
                  top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
              child: Text(
                "Taski Proveedores",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: "PoppinsRegular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xff2a7de1)),
                    child: makeListTile,
                  ),
                ),
              ],
            )

          ],
        ));
  }
}
