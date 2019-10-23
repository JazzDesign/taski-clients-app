import 'package:flutter/material.dart';
import 'client_menu.dart';
import 'login_signup_page.dart';
import 'services/authentication.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notDetermined, notLoggedIn, loggedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.notLoggedIn : AuthStatus.loggedIn;
      });
    });
  }

  void _onLoggedIn() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.loggedIn;
    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.notLoggedIn;
      _userId = "";
    });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
        break;
      case AuthStatus.notLoggedIn:
        return Scaffold(
          body: LoginSignUpPage(
            auth: widget.auth,
            onSignedIn: _onLoggedIn,
          ),
        );
        break;
      case AuthStatus.loggedIn:
        if (_userId.isNotEmpty && _userId != null) {
          return Scaffold(
            body: ClientMenu(
                /*userId: _userId,
              auth: widget.auth,
              onSignedOut: _onSignedOut,*/
                ),
          );
        } else {
          return _buildWaitingScreen();
        }
        break;
      default:
        return _buildWaitingScreen();
    }
  }
}
