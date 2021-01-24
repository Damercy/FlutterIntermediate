class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  // Syntax for named constructor. Allows us to instantiate from  a class in multiple ways.

  ImageModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    url = jsonData['url'];
    title = jsonData['title'];
  }

  // Alternative shorthand syntax for named constructor
  /*
    ImageModel.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'],
        url = jsonData['url'],
        title = jsonData['title'];

  */
}
