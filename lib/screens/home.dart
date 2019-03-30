import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    );
  }

  // Password
  Widget passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'more 6 Charator',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }

  // Button SignIn
  Widget signInButton() {
    return RaisedButton(
      color: Colors.red[800],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  // Button SignUp
  Widget signUpButton() {
    return RaisedButton(
      color: Colors.red[200],
      child: Text(
        'Sing Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
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
                      child: signInButton(),
                    ),
                    new Expanded(
                      child: signUpButton(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
