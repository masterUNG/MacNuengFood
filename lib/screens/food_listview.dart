import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodListView extends StatelessWidget {
  List<FoodModel> foodModels;
  FoodListView(this.foodModels);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (context, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Text(foodModels[index].NameFood),
              )
            ],
          ),
        );
      },
    );
  }
}
