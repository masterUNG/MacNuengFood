import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/food_model.dart';
import '../models/post_model.dart';

class AddFood extends StatefulWidget {
  final String nameLogin;
  AddFood({Key key, this.nameLogin}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  // Explcit
  String urlString = 'https://www.androidthai.in.th/mac/getAllFoodMaster.php';
  String url2String = 'https://jsonplaceholder.typicode.com/posts';

  List<FoodModel> myFoodModels = [];
  List<PostModel> myPostModels = [];

  void initState() {
    super.initState();
    loadDataFromJson();
  }

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

  void loadDataFromJson() async {
    print('loadData Work');
    var response = await http.get(urlString);
    var result = json.decode(response.body);
    print(result);

    for (var objJSON in result) {
      myFoodModels.add(FoodModel.formJSON(objJSON));
    }

    setState(() {});
  }

  Widget showListView(BuildContext context1) {
    return ListView.builder(
      itemCount: myFoodModels.length,
      itemBuilder: (context1, int index) {
        return Text(myFoodModels[index].NameFood);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: showTitle(),
        ),
        body: showListView(context));
  }
}
