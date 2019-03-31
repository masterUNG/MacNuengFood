import 'package:flutter/material.dart';
import 'register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../models/user_model.dart';
import 'add_food.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Key
  final homeFormKey = GlobalKey<FormState>();
  final homeScaffoldkey = GlobalKey<ScaffoldState>();

  // Explicit
  String email, password;

  // Logo
  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  // App Name
  Widget showAppName() {
    return Text(
      'Mac an Nueng',
      style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[900]),
    );
  }

  // Email
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email Address :',
          hintText: 'you@email.com'),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Email Format';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  // Password
  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'more 6 Charator',
          labelStyle: TextStyle(color: Colors.white)),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password more 6 Charator';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  // Button SignIn
  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.red[800],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        checkEmailAnPass(context);
      },
    );
  }

  void checkEmailAnPass(BuildContext context) async {
    if (homeFormKey.currentState.validate()) {
      homeFormKey.currentState.save();
      print('email = $email, password = $password');
      String urlString =
          'https://www.androidthai.in.th/mac/getUserWhereUserMaster.php?isAdd=true&Email=$email';

      var response = await get(urlString);
      var result = json.decode(response.body);
      print('result = $result');

      if (result.toString() == 'null') {
        // User False
        showSnackBar('No $email in my Database');
      } else {
        // User True
        for (var objJSON in result) {
          print('objJSON = $objJSON');
          var userModel = UserModel.fromJSON(objJSON);
          String truePassword = userModel.password.toString();
          String nameLogin = userModel.name.toString();

          if (password == truePassword) {
            showSnackBar('Welcome $nameLogin');
            var addFoodRoute = new MaterialPageRoute(
                builder: (BuildContext context) => AddFood(nameLogin: nameLogin,));
            Navigator.of(context).push(addFoodRoute);
          } else {
            showSnackBar('Please Try Again Password False');
          }
        }
      }
    }
  }

  void showSnackBar(String messageString) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.red[900],
      duration: new Duration(seconds: 8),
      content: Text(messageString),
      action: new SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    homeScaffoldkey.currentState.showSnackBar(snackBar);
  }

  // Button SignUp
  Widget signUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.red[200],
      child: Text(
        'Sing Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignUp');
        var registerRoute = new MaterialPageRoute(
            builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeScaffoldkey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: homeFormKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green[700], Colors.green[50]],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 80.0),
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                children: <Widget>[
                  showLogo(),
                  showAppName(),
                  Container(
                    margin: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: emailTextField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: passwordTextField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                          child: signInButton(context),
                        ),
                        new Expanded(
                          child: signUpButton(context),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
