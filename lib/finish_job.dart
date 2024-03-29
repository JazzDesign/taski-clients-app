import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taski_clients/full_screen_photo.dart';
import 'package:path/path.dart';

class FinishJob extends StatefulWidget {
  final DocumentSnapshot document;

  FinishJob(this.document);

  @override
  _FinishJobState createState() => _FinishJobState();
}

class _FinishJobState extends State<FinishJob> {
  List<File> photos = [];
  List<String> rejectedPhotos = [];
  List<String> finishedPhotos = [];

  double rating = 1;

  bool isRejected = false;

  bool _loadingPhoto = false;
  bool _photoUploaded = false;

  final TextEditingController controller = TextEditingController();

  Future getImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      photos.add(image);
    });
    await uploadPic(context, image);
  }

  Future uploadPic(BuildContext context, File image) async {
    String fileName = basename(image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    setState(() {
      _photoUploaded = false;
      _loadingPhoto = true;
    });
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    print("Profile Picture uploaded");
    rejectedPhotos.add(url.toString());
    setState(() {
      _loadingPhoto = false;
      _photoUploaded = false;
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.document['finishedPhotos'] != null) {
      finishedPhotos = (widget.document['finishedPhotos'] as Iterable)
          .cast<String>()
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Revisar trabajo',
          style: TextStyle(
            fontFamily: "PoppinsRegular",
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height / 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Fotos del trabajo",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: primaryColor,
                        child: finishedPhotos.isEmpty
                            ? Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    "No hay fotos del trabajo",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ])
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: finishedPhotos.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Image.network(finishedPhotos[index]),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return FullScreenPhoto(
                                            finishedPhotos[index]);
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
            widget.document['finishedComment'] != null &&
                    widget.document['finishedComment'].toString().isNotEmpty
                ? Container(
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
                              "Comentario",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              widget.document['finishedComment'],
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : null,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Text(
                "Rating",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RatingBar(
                initialRating: 5,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  this.rating = rating;
                },
              ),
            ),
            !isRejected
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          textColor: Color(0xff2a7de1),
                          color: Color(0xff2a7de1),
                          padding: const EdgeInsets.only(
                              top: 20.0,
                              right: 20.0,
                              left: 20.0,
                              bottom: 20.0),
                          child: Text(
                              'Rechazar',
                            style: TextStyle(fontFamily: "PoppinsRegular"),
                          ),
                          onPressed: () {
                            setState(() {
                              isRejected = true;
                            });
                          },
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          textColor: Colors.white,
                          color: Color(0xff2a7de1),
                          padding: const EdgeInsets.only(
                              top: 20.0,
                              right: 20.0,
                              left: 20.0,
                              bottom: 20.0),
                          child: Text(
                              'Aceptar',
                            style: TextStyle(fontFamily: "PoppinsRegular"),
                          ),
                          onPressed: () {
                            widget.document.reference.setData({'state': 'DONE'},
                                merge: true).then((snapshot1) {
                              Firestore.instance
                                  .collection(
                                      "users/${widget.document['provider']}/jobs")
                                  .document(
                                      widget.document['providerJob'].toString())
                                  .setData({'state': 'DONE'}, merge: true).then(
                                      (snapshot2) {
                                Firestore.instance
                                    .collection("users")
                                    .document(widget.document['provider'])
                                    .get()
                                    .then((doc) {
                                  doc.reference.setData({
                                    'rating': doc['rating'] + rating,
                                    'ratingCount': doc['ratingCount'] + 1
                                  }, merge: true).then((doc) {
                                    Navigator.of(context).pop();
                                  });
                                });
                              });
                            });
                          },
                        )
                      ],
                    ))
                : Container(),
            isRejected
                ? Container(
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
                              color: primaryColor,
                              child: photos.isEmpty
                                  ? Row(children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(
                                          "No tienes fotos aun",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ])
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: photos.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(photos[index]),
                                      ),
                                    ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  getImage(context);
                                },
                                child: Text("Subir Foto"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(_loadingPhoto
                                    ? 'Subiendo foto...'
                                    : (_photoUploaded
                                        ? 'Foto subida correctamente'
                                        : '')),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            isRejected
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Comentarios (opcional)",
                      ),
                      controller: controller,
                    ),
                  )
                : Container(),
            isRejected
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: RaisedButton(
                      child: Text('Subir'),
                      onPressed: () {
                        widget.document.reference.setData({
                          'state': 'REJECTED',
                          'rejectedPhotos': rejectedPhotos,
                          'rejectedComment': controller.text
                        }, merge: true).then((snapshot1) {
                          Firestore.instance
                              .collection(
                                  "users/${widget.document['provider']}/jobs")
                              .document(
                                  widget.document['providerJob'].toString())
                              .setData({
                            'state': 'REJECTED',
                            'rejectedPhotos': rejectedPhotos,
                            'rejectedComment': controller.text
                          }, merge: true).then((snapshot2) {
                            Firestore.instance
                                .collection("users")
                                .document(widget.document['provider'])
                                .get()
                                .then((doc) {
                              doc.reference.setData({
                                'rating': doc['rating'] + rating,
                                'ratingCount': doc['ratingCount'] + 1
                              }, merge: true).then((doc) {
                                Navigator.of(context).pop();
                              });
                            });
                          });
                        });
                      },
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
