import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnect {
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'card');
    var database =
      await openDatabase(path, version: 2, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async{
    await database.execute(
      '''CREATE TABLE business_card(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    FullName TEXT,
    workArea TEXT,
    phoneNO int,
    email TEXT,
    jobType TEXT,
    company TEXT
  )
'''
    );
  }
}