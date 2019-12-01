import 'package:flutter/material.dart';

class FullScreenPhoto extends StatelessWidget {
  final String photoUrl;

  FullScreenPhoto(this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'photo',
            child: Image.network(photoUrl),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
