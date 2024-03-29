import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'services/authentication.dart';

//Color taski = const Color(0x2A7DE1);

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _LoginSignUpPageState createState() => new _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _nameSignUpController = TextEditingController();
  final _emailSignUpController = TextEditingController();
  final _passwordSignUpController = TextEditingController();

  String _errorMessage = "";
  String _pwErrorMessage = "";
  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";
  String _nameErrorMessage = "";

  bool _isLoading;
  bool _isSignUpLoading;

  Widget homePage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop),
          image: AssetImage('images/bg-login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(
              top: 150.0,
            ),
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/logo-taski.png'),
            )),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.white),
                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "Iniciar Sesión",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'PoppinsRegular',
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.white),
                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoSingUp(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "Registrarse",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'PoppinsRegular',
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget singUp() {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage('images/bg-login.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 60.0,
                  bottom: 20.0,
                ),
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/logo-taski.png'),
                )),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Nombre Completo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                          textAlign: TextAlign.left,
                          controller: _nameSignUpController,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PoppinsRegular'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Juan Perez',
                            errorText: _nameErrorMessage.isEmpty
                                ? null
                                : _nameErrorMessage,
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                          onChanged: (str) {
                            _nameErrorMessage = "";
                          }),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                          textAlign: TextAlign.left,
                          controller: _emailSignUpController,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PoppinsRegular'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorText: _emailErrorMessage.isEmpty
                                ? null
                                : _emailErrorMessage,
                            hintText: 'correo@gmail.com',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                          onChanged: (str) {
                            _emailErrorMessage = "";
                          }),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "PASSWORD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                          obscureText: true,
                          textAlign: TextAlign.left,
                          controller: _passwordSignUpController,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PoppinsRegular'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            errorText: _passwordErrorMessage.isEmpty
                                ? null
                                : _passwordErrorMessage,
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'PoppinsRegular',
                            ),
                          ),
                          onChanged: (str) {
                            _passwordErrorMessage = "";
                          }),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: 32,
                  height: 32,
                  child: _isSignUpLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(),
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new OutlineButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                        highlightedBorderColor: Colors.white,
                        onPressed: () {
                          _validateAndSubmitSignUp(context);
                        },
                        child: new Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: Text(
                                  "Registrarse",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PoppinsRegular',
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginPage() {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage('images/bg-login.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 60.0,
                  bottom: 20.0,
                ),
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/logo-taski.png'),
                )),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "EMAIL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'PoppinsRegular'),
                        controller: _emailEditingController,
                        onChanged: (str) {
                          _errorMessage = "";
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'correo@gmail.com',
                          errorText:
                              _errorMessage.isEmpty ? null : _errorMessage,
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "PASSWORD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'PoppinsRegular'),
                        controller: _passwordEditingController,
                        onChanged: (str) {
                          _pwErrorMessage = "";
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '*********',
                          errorText:
                              _pwErrorMessage.isEmpty ? null : _pwErrorMessage,
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: new FlatButton(
                      child: new Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'PoppinsRegular',
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                alignment: Alignment.center,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new OutlineButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                        highlightedBorderColor: Colors.white,
                        onPressed: _isLoading ? null : _validateAndSubmit,
                        child: new Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: Text(
                                  "Iniciar Sesión",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PoppinsRegular',
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.55)),
                      ),
                    ),
                    Text(
                      "Usar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PoppinsRegular',
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white, width: 0.55)),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(right: 8.0),
                        alignment: Alignment.center,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                color: Theme.of(context).primaryColor,
                                onPressed: () => {},
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: new FlatButton(
                                          onPressed: () => {},
                                          padding: EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                          ),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                "Facebook",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'PoppinsRegular'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.center,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                onPressed: () => {},
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: new FlatButton(
                                          onPressed: () => {},
                                          padding: EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                          ),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                "Google",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
              )
            ],
          ),
        ),
      ),
    );
  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  gotoSingUp() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  void initState() {
    _isLoading = false;
    _isSignUpLoading = false;

    _errorMessage = "";
    _pwErrorMessage = "";
    _emailErrorMessage = "";
    _passwordErrorMessage = "";
    _nameErrorMessage = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[singUp(), homePage(), loginPage()],
          scrollDirection: Axis.horizontal,
        ));
  }

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    return _emailEditingController.value.text != null &&
        _emailEditingController.value.text.isNotEmpty &&
        _passwordEditingController.value.text != null &&
        _passwordEditingController.value.text.isNotEmpty;
  }

  // Perform login or signup
  Future<void> _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        userId = await widget.auth.signIn(_emailEditingController.value.text,
            _passwordEditingController.value.text);
        print('Signed in: $userId');

        setState(() {
          _isLoading = false;
        });

        if (userId.isNotEmpty && userId != null) {
          if (!(await widget.auth.isEmailVerified())) {
            await showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Valida tu cuenta',
                      style: TextStyle(color: Colors.black),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            'Tienes que validar tu cuenta primero.',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Revisa tu buzon de correo.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Entendido'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
            await widget.auth.signOut();
            setState(() {
              _passwordEditingController.text = "";
            });
          } else {
            DocumentSnapshot doc = await Firestore.instance
                .collection("users")
                .document(userId)
                .get();
            if (doc.data['userType'] == "consumer") {
              widget.onSignedIn();
            } else {
              await showDialog<void>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'App para provedores',
                        style: TextStyle(color: Colors.black),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                              'Parece que quieres acceder usando tu cuenta de provedor.',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Puedes descargar la app de provedores en la Play Store.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Entendido'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              await widget.auth.signOut();
              setState(() {
                _emailEditingController.text = "";
                _passwordEditingController.text = "";
              });
            }
          }
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          print(e.code);
          switch (e.code as String) {
            case 'ERROR_INVALID_EMAIL':
              _errorMessage = 'Correo Invalido';
              break;
            case 'ERROR_WRONG_PASSWORD':
              _pwErrorMessage = 'Contraseña Incorrecta';
              break;
            default:
              _errorMessage = 'Error';
              break;
          }
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _errorMessage = "Ingresa usuario y contraseña";
        _pwErrorMessage = "";
        _isLoading = false;
      });
    }
  }

  // Check if form is valid before perform login or signup
  bool _validateAndSaveSignUp() {
    if (_nameSignUpController.value.text == null ||
        _nameSignUpController.value.text.isEmpty) {
      _nameErrorMessage = "Ingresa tu nombre";
      return false;
    }
    if (_emailSignUpController.value.text == null ||
        _emailSignUpController.value.text.isEmpty) {
      _emailErrorMessage = "Ingresa tu correo electronico";
      return false;
    }
    if (_passwordSignUpController.value.text == null ||
        _passwordSignUpController.value.text.isEmpty) {
      _passwordErrorMessage = "Ingresa tu contraseña";
      return false;
    }
    return true;
  }

  // Perform login or signup
  Future<void> _validateAndSubmitSignUp(BuildContext context) async {
    setState(() {
      _nameErrorMessage = "";
      _emailErrorMessage = "";
      _passwordErrorMessage = "";
      _isSignUpLoading = true;
    });
    if (_validateAndSaveSignUp()) {
      print("signing up");
      String userId = "";
      try {
        userId = await widget.auth.signUp(_emailSignUpController.value.text,
            _passwordSignUpController.value.text);

        FirebaseUser user = await widget.auth.getCurrentUser();
        UserUpdateInfo userInfo = UserUpdateInfo();
        userInfo.displayName = _nameSignUpController.text.toString();
        await user.updateProfile(userInfo);

        await Firestore.instance.collection("users").document(userId).setData({
          'name': userInfo.displayName,
          'email': user.email,
          'userType': 'consumer',
          'picture': ''
        });

        await widget.auth.sendEmailVerification();

        print('Signed in: $userId');

        await widget.auth.signOut();

        setState(() {
          _isSignUpLoading = false;
        });

        await _showConfirmation(context);

//        Navigator.of(context).pop();
        gotoLogin();
      } catch (e) {
        print('Error: $e');
        setState(() {
          print(e.code);
          switch (e.code as String) {
            case 'ERROR_EMAIL_ALREADY_IN_USE':
              _emailErrorMessage = "Este correo ya existe";
              break;
            case 'ERROR_INVALID_EMAIL':
              _emailErrorMessage = "Correo con mal formato";
              break;
          }
          _isSignUpLoading = false;
        });
      }
    } else {
      print("Error");
      setState(() {
        _isSignUpLoading = false;
      });
    }
  }

  Future<void> _showConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Valida tu cuenta',
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Hemos enviado un email a tu correo.',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Haz click el link en el correo para validar tu cuenta.',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Entendido'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
