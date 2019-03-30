import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Key
  final registerFormKey = GlobalKey<FormState>();

  // Explicit
  String name, email, password;

  // Name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Display Name :', hintText: 'Your Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Type Your Name';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  // Email
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address :', hintText: 'you@abc.com'),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Email Format you@email.com';
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
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'more 6 Charator'),
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

  // For Action
  Widget showAction(BuildContext context) {
    return IconButton(
      tooltip: 'Upload Value To Server',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        uploadValueToServer(context);
      },
    );
  }

  void uploadValueToServer(BuildContext context) async{
    print('You Click Upload');
    print(registerFormKey.currentState.validate());
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      print('name = $name, email = $email, password = $password');

      String urlString = 'https://www.androidthai.in.th/mac/addDataMaster.php?isAdd=true&Name=$name&Email=$email&Password=$password';
      var response = await get(urlString);
      var result = json.decode(response.body);
      print('result = $result');

      if (result.toString() == 'true') {
        Navigator.pop(context);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register'),
          actions: <Widget>[showAction(context)],
        ),
        body: Form(
          key: registerFormKey,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.greenAccent[700],
                Colors.greenAccent[100]
              ], begin: Alignment(-1, -1))),
              alignment: Alignment(0, 0),
              child: Container(
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white,
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 2.0,
                        color: Colors.blue[900])),
                margin: EdgeInsets.all(50.0),
                child: Column(
                  children: <Widget>[
                    nameTextField(),
                    emailTextField(),
                    passwordTextField()
                  ],
                ),
              )),
        ));
  }
}
