import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'],
        deleted = jsonData['deleted'],
        type = jsonData['type'],
        by = jsonData['by'],
        time = jsonData['time'],
        text = jsonData['text'],
        dead = jsonData['dead'],
        parent = jsonData['parent'],
        kids = jsonData['kids'],
        url = jsonData['url'],
        score = jsonData['score'],
        title = jsonData['title'],
        descendants = jsonData['descendants'];

  ItemModel.fromDb(Map<String, dynamic> dbData)
      : id = dbData['id'],
        deleted = dbData['deleted']==1,
        type = dbData['type'],
        by = dbData['by'],
        time = dbData['time'],
        text = dbData['text'],
        dead = dbData['dead']==1,
        parent = dbData['parent'],
        kids = jsonDecode(dbData['kids']),
        url = dbData['url'],
        score = dbData['score'],
        title = dbData['title'],
        descendants = dbData['descendants'];
}
