import 'package:flutter/material.dart';
import 'login_signup_page.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff2a7de1),
        ),
        home: LoginSignUpPage(),
    );
  }
}