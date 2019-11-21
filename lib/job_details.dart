import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'formatters.dart';
import 'views/arc_clipper.dart';
import 'views/label_icon.dart';

class JobDetailsScreen extends StatefulWidget {
  final String _jobPath;
  final String _jobId;

  JobDetailsScreen(this._jobPath, this._jobId);

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  DocumentSnapshot document;
  bool _loadingJob = true;

  @override
  void initState() {
    super.initState();

//    String path = widget.isOffer ? "categories"
    Firestore.instance
        .collection(widget._jobPath)
        .document(widget._jobId)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        document = snapshot;
        _loadingJob = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List<dynamic> photos = [];
    if (document != null && document['photos'] != null) {
      photos = (document['photos'] as List<dynamic>);
    }
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de trabajo'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: ClipPath(
                  clipper: ArcClipper(),
                  child: _loadingJob
                      ? Center(child: CircularProgressIndicator())
                      : Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [primaryColor, Colors.blue],
                              )),
                            ),
                            Container(
                                width: double.infinity,
                                child: photos.isNotEmpty
                                    ? Image.network(
                                        photos[0].toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Container())
                          ],
                        ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(),
              )
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: deviceSize.height / 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Card(
                    elevation: 2.0,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            document != null
                                ? document['title'].toString()
                                : "",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(document != null
                              ? document['address'].toString()
                              : "", style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              LabelIcon(
                                icon: Icons.star,
                                iconColor: Colors.cyan,
                                label: "4.0",
                              ),
                              Text(
                                document != null
                                    ? "Q${Formatters.usd.format(int.parse(document["price"].toString()))}"
                                    : "",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.0),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height / 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Card(
                      color: primaryColor,
                      elevation: 2.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: photos.length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(photos[i].toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Card(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Descripcion",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            document != null
                                ? document['description'].toString()
                                : "",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Card(
                    color: RallyColors.cardBackground,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Actions")),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
      /*floatingActionButton: CustomFloat(
        builder: Text(
          "5",
          style: TextStyle(color: Colors.white, fontSize: 10.0),
        ),
        icon: Icons.check,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Ink(
          height: 50.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [primaryColor, Colors.blue])),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getBottomNavigationButtons()),
        ),
      ),
    );
  }

  List<Widget> _getBottomNavigationButtons() {
    List<Widget> children = [];

    if (document == null) {
      return children;
    }

    if (document["state"] == null) {
      children.add(
        SizedBox(
          height: double.infinity,
          child: InkWell(
            onTap: () {
//            document.reference.setData({'state': 'SCHEDULED'},
//                merge: true).then((snapshot) {
//              Navigator.of(context).popUntil((route) {
//                return route.isFirst;
//              });
//            });
              print("Solicitar!");
            },
            radius: 10.0,
            splashColor: Colors.yellow,
            child: Center(
              child: Text(
                "Solicitar",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      );
    } else if (document["state"] == "PENDING") {
      children.addAll(
        <Widget>[
          SizedBox(
            height: double.infinity,
            child: InkWell(
              radius: 10.0,
              splashColor: Colors.yellow,
              onTap: () {},
              child: Center(
                child: Text(
                  "Rechazar",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          SizedBox(
            height: double.infinity,
            child: InkWell(
              onTap: () {
                document.reference.setData({'state': 'SCHEDULED'},
                    merge: true).then((snapshot) {
                  Firestore.instance
                      .collection("users/${document['consumer']}/jobs")
                      .document(document['consumerJob'].toString())
                      .setData({'state': 'SCHEDULED'}, merge: true).then(
                          (snapshot) {
                    Navigator.of(context).popUntil((route) {
                      return route.isFirst;
                    });
                  });
                });
              },
              radius: 10.0,
              splashColor: Colors.yellow,
              child: Center(
                child: Text(
                  "Aceptar",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (document["state"] == "SCHEDULED") {
      children.add(
        SizedBox(
          height: double.infinity,
          child: InkWell(
            onTap: () {
              document.reference
                  .setData({'state': 'DONE'}, merge: true).then((snapshot) {
                Firestore.instance
                    .collection("users/${document['consumer']}/jobs")
                    .document(document['consumerJob'].toString())
                    .setData({'state': 'DONE'}, merge: true).then((snapshot) {
                  Navigator.of(context).popUntil((route) {
                    return route.isFirst;
                  });
                });
              });
            },
            radius: 10.0,
            splashColor: Colors.yellow,
            child: Center(
              child: Text(
                "Marcar Como Terminado",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
    return children;
  }
}
