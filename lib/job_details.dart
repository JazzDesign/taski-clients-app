import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taski_clients/service_description.dart';

import 'chat.dart';
import 'custom_float.dart';
import 'finish_job.dart';
import 'formatters.dart';
import 'full_screen_photo.dart';
import 'provider_profile.dart';
import 'views/arc_clipper.dart';
import 'views/label_icon.dart';

class JobDetailsScreen extends StatefulWidget {
  final String _jobPath;
  final String _jobId;
  final String _userId;

  JobDetailsScreen(this._jobPath, this._jobId, this._userId);

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
                          Text(
                            document != null
                                ? document['address'].toString()
                                : "",
                            style: TextStyle(color: Colors.white),
                          ),
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
                          child: GestureDetector(
                            child: Image.network(photos[i].toString()),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return FullScreenPhoto(photos[i]);
                              }));
                            },
                          ),
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: (document != null && document['requests'] != null)
                      ? Card(
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      document != null &&
                                              document['requests'] != null &&
                                              (document['requests'] as Iterable)
                                                  .toList()
                                                  .isNotEmpty
                                          ? "Solicitudes"
                                          : "Todavia no tienes solicitudes.",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  ...(document != null &&
                                          document['requests'] != null
                                      ? (document['requests'] as Iterable)
                                          .toList()
                                          .map((request) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                request['name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  FlatButton(
                                                    child: Text(
                                                      'Ver Perfil',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProviderProfile(
                                                                    request[
                                                                        'id'])),
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
                                                      );
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: Text(
                                                      'Rechazar',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      List<dynamic> requests =
                                                          (document['requests']
                                                                  as Iterable)
                                                              .toList();

                                                      requests
                                                          .removeWhere((req) {
                                                        return req['id'] ==
                                                            request['id'];
                                                      });
                                                      document.reference
                                                          .setData({
                                                        'requests': requests
                                                      }, merge: true).then(
                                                              (doc) {
                                                        Firestore.instance
                                                            .collection(
                                                                "categories/${document.data['categoryId']}/jobs")
                                                            .where(
                                                                'consumerJob',
                                                                isEqualTo: document
                                                                    .documentID)
                                                            .getDocuments()
                                                            .then((snapshot) {
                                                          for (DocumentSnapshot ds
                                                              in snapshot
                                                                  .documents) {
                                                            ds.reference
                                                                .setData({
                                                              'requests':
                                                                  requests
                                                            }, merge: true);
                                                          }
                                                        });
                                                      });
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      document.reference
                                                          .setData({
                                                        'state': 'SCHEDULED',
                                                        'requests': null
                                                      }, merge: true).then(
                                                              (doc) {
                                                        Map<String, dynamic>
                                                            data =
                                                            document.data;
                                                        data['state'] =
                                                            'SCHEDULED';
                                                        data['requests'] = null;
                                                        data['consumerJob'] =
                                                            document.documentID;
                                                        Firestore.instance
                                                            .collection(
                                                                "users/${request['id']}/jobs")
                                                            .add(data)
                                                            .then((doc) {
                                                          Firestore.instance
                                                              .collection(
                                                                  "categories/${data['categoryId']}/jobs")
                                                              .where(
                                                                  'consumerJob',
                                                                  isEqualTo:
                                                                      document
                                                                          .documentID)
                                                              .getDocuments()
                                                              .then((snapshot) {
                                                            for (DocumentSnapshot ds
                                                                in snapshot
                                                                    .documents) {
                                                              ds.reference
                                                                  .delete();
                                                            }
                                                          });
                                                        });
                                                      });
                                                    },
                                                  )
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                              ),
                                            ],
                                          );
                                        })
                                      : []),
                                ]),
                          ),
                        )
                      : null,
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
      floatingActionButton: document != null && document['provider'] != null
          ? CustomFloat(
              icon: Icons.chat,
              qrCallback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<Chat>(
                        builder: (context) => Chat(
                            widget._userId, document['provider'].toString())));
              },
            )
          : null,
      floatingActionButtonLocation:
          document != null && document['provider'] != null
              ? FloatingActionButtonLocation.centerDocked
              : null,
      bottomNavigationBar: (document != null &&
              (document['state'] == 'FINISHED' || document['state'] == 'DONE')
          ? BottomAppBar(
              clipBehavior: Clip.antiAlias,
              shape: CircularNotchedRectangle(),
              child: Ink(
                height: 50.0,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [primaryColor, Colors.blue])),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _getBottomNavigationButtons()),
              ),
            )
          : null),
    );
  }

  List<Widget> _getBottomNavigationButtons() {
    List<Widget> children = [];
    if (document['state'] == 'FINISHED') {
      children.add(
        SizedBox(
          height: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<FinishJob>(
                  builder: (context) => FinishJob(document),
                ),
              );
            },
            radius: 10.0,
            splashColor: Colors.yellow,
            child: Center(
              child: Text(
                "Revisar",
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

    if (document['state'] == 'DONE') {
      children.add(
        SizedBox(
          height: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDescription(
                          widget._userId,
                          document['categoryId'],
                          "pago-hora",
                          jobDocument: document,
                        )),
//                          MaterialPageRoute(builder: (context) => ServiceDescription()),
              );
            },
            radius: 10.0,
            splashColor: Colors.yellow,
            child: Center(
              child: Text(
                "Solicitar trabajo de nuevo",
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
