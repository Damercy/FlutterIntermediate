import 'package:UdemyFlutter/src/resources/repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider implements Source{
  Database db;

  void init() async{

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path,"items.db");

    db = await openDatabase(
    path,
    version: 1,
    onCreate: (Database newDb,int version){

      // New database created; setup tables;
      newDb.execute("""
      CREATE TABLE items(
        id INTEGER PRIMARY KEY,
        type TEXT,
        by TEXT,
        time INTEGER,
        text TEXT,
        parent INTEGER,
        kids BLOB,
        dead INTEGER,
        deleted INTEGER,
        url TEXT,
        title TEXT,
        descendants INTEGER
        )
      """);
    });
  }

  Future<ItemModel> fetchItem(int id)async{
    final result =  await db.query(
      "items",
      columns: null,
      where: "$id=?",
      whereArgs: [id]
      );

      if(result.isNotEmpty)
        return ItemModel.fromDb(result.first);
      return null;
  }

  Future<int> addItem(ItemModel item){
    return db.insert("items", item.toMap());
  }

  // TODO: Add fetchTopIds() logic
  Future<List<int>> fetchTopIds(){
    return null;
  }
}