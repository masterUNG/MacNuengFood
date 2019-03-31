import 'package:flutter/material.dart';

class AddFood extends StatefulWidget {
  final String nameLogin;
  AddFood({Key key, this.nameLogin}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  Widget showTitle() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment(-1, -1),
            child: Text('Add Food'),
          ),
          Container(
            alignment: Alignment(-1, -1),
            child: Text(
              'Login by ${widget.nameLogin}',
              style: TextStyle(fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showTitle(),
      ),
      body: Text('body'),
    );
  }
}
