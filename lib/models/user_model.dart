class UserModel {
  // Field
  int id;
  String name, email, password;

  // Constructor
  // UserModel(
  //     int idInt, String nameString, String emailString, String passwordString) {
  //   id = idInt;
  //   name = nameString;
  //   email = emailString;
  //   password = passwordString;
  // }

  UserModel(this.id, this.name, this.email, this.password);

  UserModel.fromJSON(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    name = parseJSON['Name'];
    email = parseJSON['Email'];
    password = parseJSON['Password'];
  }

}
