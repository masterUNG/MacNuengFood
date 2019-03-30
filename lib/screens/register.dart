import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Display Name :', hintText: 'Your Name'),
    );
  }

  // Email
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address :', hintText: 'you@abc.com'),
    );
  }

  // Password
  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password :', hintText: 'more 6 Charator'),
    );
  }

  // For Action
  Widget showAction() {
    return IconButton(tooltip: 'Upload Value To Server',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('You Click Upload');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[showAction()],
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.greenAccent[700], Colors.greenAccent[100]],
                  begin: Alignment(-1, -1))),
          alignment: Alignment(0, 0),
          child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                border: Border.all(
                    style: BorderStyle.solid, width: 3.0, color: Colors.blue)),
            margin: EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                nameTextField(),
                emailTextField(),
                passwordTextField()
              ],
            ),
          )),
    );
  }
}
