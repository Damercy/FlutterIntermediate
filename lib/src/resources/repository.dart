import 'dart:async';
import 'news_api_provider.dart';
import 'news_db-provider.dart';
import '../models/item_model.dart';


class Repository{

   // Using same database provider instance as sqflite doesn't allow multiple instances to access same database
  List<Source> sources = <Source>[newsDbProvider,NewsApiProvider()];
  List<Cache> caches = <Cache>[newsDbProvider];

  Future<List<int>> fetchTopIds() async {
      Source source;
      List<int> topIds;
      for(source in sources){
        topIds = await source.fetchTopIds();
        if(topIds!=null)
          break;
      }
      return topIds;
  }

  Future<ItemModel> fetchItem(int id) async {

    Source source;
    ItemModel item;
    Cache cache;

    for(source in sources){
        item = await source.fetchItem(id);
        if(item!=null)
          break;
    }

  for(cache in caches){
    cache.addItem(item);
  }

    return item;
  }

}

abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache{
  Future<int> addItem(ItemModel item);
}