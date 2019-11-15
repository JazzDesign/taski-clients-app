import 'package:flutter/material.dart';

class HeaderClip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContentClip(),
      child: Container(
        height: 180.00,
        decoration: BoxDecoration(
          color: Color(0xff2a7de1),
        ),
      ) ,
    );
  }
}


class ContentClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height-50);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width/2, size.height);

    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}