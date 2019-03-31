class FoodModel {

  // Field
  int id;
  String NameFood, Price, Detail, ImagePath;

  // Contructor
  FoodModel(this.id, this.NameFood, this.Price, this.Detail, this.ImagePath);

  FoodModel.formJSON(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    NameFood = parseJSON['NameFood'];
    Price = parseJSON['Price'];
    Detail = parseJSON['Detail'];
    ImagePath = parseJSON['ImagePath'];
  }
  
}