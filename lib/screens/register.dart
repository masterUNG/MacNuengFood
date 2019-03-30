import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Key
  final registerFormKey = GlobalKey<FormState>();

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
    );
  }

  // For Action
  Widget showAction() {
    return IconButton(
      tooltip: 'Upload Value To Server',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        uploadValueToServer();
      },
    );
  }

  void uploadValueToServer() {
    print('You Click Upload');
    print(registerFormKey.currentState.validate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register'),
          actions: <Widget>[showAction()],
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
                        width: 3.0,
                        color: Colors.blue)),
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
