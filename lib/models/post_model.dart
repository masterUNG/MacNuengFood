class PostModel {

  int id;
  String title, body;

  PostModel(this.id, this.title, this.body);

  PostModel.fromJSON(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    title = parseJSON['title'];
    body = parseJSON['body'];
  }

  
}