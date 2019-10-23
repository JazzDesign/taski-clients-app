import 'package:flutter/material.dart';
import 'root_page.dart';
import 'services/authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff2a7de1),
          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              errorStyle: TextStyle(color: Colors.red.shade100, fontSize: 16))),
      home: RootPage(
        auth: Auth(),
      ),
    );
  }
}
