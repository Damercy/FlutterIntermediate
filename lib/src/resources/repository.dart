import 'dart:async';
import 'news_api_provider.dart';
import 'news_db-provider.dart';
import '../models/item_model.dart';


class Repository{

  List<Source> sources = <Source>[NewsDbProvider(),NewsApiProvider()];
  List<Cache> caches = <Cache>[NewsDbProvider()];

  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopIds();
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