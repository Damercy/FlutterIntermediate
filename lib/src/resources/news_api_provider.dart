import 'dart:convert';
import 'package:UdemyFlutter/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

// prefixing with _ makes variable private; without _ it's public and automatically exported
final _baseUrl = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider{

  Client client = Client();

  Future<List<int>> fetchTopIds() async{
      final response = await client.get("$_baseUrl/topstories.json");
      final ids = jsonDecode(response.body);
      return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$_baseUrl/item/$id.json");
    final item = jsonDecode(response.body);
    return ItemModel.fromJson(item);
  }

}