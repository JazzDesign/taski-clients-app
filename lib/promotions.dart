import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Promotions extends StatefulWidget {



  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  final List<String> numbers = ["10% de Descuento", "15% de Descuento", "20% de Descuento", "5% de Descuento"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: numbers.length, itemBuilder: (context, index){
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              color: Color(0xffFFAEC1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 2.0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/cupon-background.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Center(child:
                Text(
                    numbers[index].toString(),
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "PoppinsRegular",
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
          ),
        );
      },
      ),
    );
  }
}
