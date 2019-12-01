import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'full_screen_photo.dart';
import 'services/profile_title.dart';

class ProviderProfile extends StatefulWidget {
  final String _userId;

  ProviderProfile(this._userId);

  @override
  _ProviderProfileState createState() => _ProviderProfileState();
}

class _ProviderProfileState extends State<ProviderProfile> {
  DocumentSnapshot user;
  List<String> photos = [];
  int jobs = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Firestore.instance
        .collection("users")
        .document(widget._userId)
        .snapshots()
        .listen((snapshot) {
      snapshot.reference
          .collection("jobs")
          .where('state', isEqualTo: 'DONE')
          .getDocuments()
          .then((snapshot2) {
        if (mounted) {
          setState(() {
            jobs = snapshot2.documents.length;

            user = snapshot;
            photos = snapshot['photos'] == null
                ? []
                : List.from(snapshot['photos'] as Iterable);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final image = user != null
        ? NetworkImage(user['logo'].toString())
        : AssetImage('images/logo-taski.png');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Perfil de Proveedor",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
            ),
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: deviceSize.height / 4,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    child: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(width: 2.0)),
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: image as ImageProvider,
                            ),
                          ),
                          Text(
                            user != null ? user['company'].toString() : "",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            user != null ? user['name'].toString() : "",
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: deviceSize.height * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ProfileTile(
                      title: user != null &&
                              (double.parse(user['ratingCount'].toString())) > 0
                          ? (double.parse(user['rating'].toString()) /
                                  double.parse(user['ratingCount'].toString()))
                              .toStringAsFixed(1)
                          : "N/R",
                      subtitle: "Rating",
                    ),
                    ProfileTile(
                      title: jobs.toString(),
                      subtitle: "Tareas Hechas",
                    ),
                    ProfileTile(
                      title: "2019",
                      subtitle: "Inicio",
                    )
                  ],
                ),
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: Container(
                  height: deviceSize.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ProfileTile(
                              title: "Pagina web",
                              subtitle:
                                  user != null ? user['web'].toString() : "",
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ProfileTile(
                              title: "Telefono",
                              subtitle:
                                  user != null ? user['phone'].toString() : "",
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ProfileTile(
                              title: "Ubicacion",
                              subtitle: "Guatemala",
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ProfileTile(
                              title: "Correo",
                              subtitle:
                                  user != null ? user['email'].toString() : "",
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ProfileTile(
                              title: "Facebook",
                              subtitle: user != null
                                  ? user['facebook'].toString()
                                  : "",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                              fontWeight: FontWeight.w700, fontSize: 18.0),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: photos.isEmpty
                              ? Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text("Proveedor no tiene fotos aun"),
                                  )
                                ])
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: photos.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      child: Image.network(photos[index]),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return FullScreenPhoto(photos[index]);
                                        }));
                                      },
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
        ));
  }
}
