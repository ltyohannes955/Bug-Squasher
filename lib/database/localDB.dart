import 'package:sqflite/sqflite.dart';
import 'db_card.dart';

class Repository {
  DatabaseConnect? _databaseConnect;

  Repository(){
    _databaseConnect = DatabaseConnect();
  }

  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _databaseConnect!.setDatabase();
    return _database!;
  }

  insertData(table, data) async{
    var connection = await database;
    return await connection.insert(
      table, 
      data,
      conflictAlgorithm: ConflictAlgorithm.replace);
  }

  readData(table) async{
    var connection = await database;
    return await connection.query(table);
  }

  UpdateData(table, data)async {
    var connection = await database;
    return await connection
      .rawUpdate('UPDATE $table SET FullName = ?, workArea = ?, phoneNO = ?, email = ?, jobType = ?, company = ? WHERE id= ?',[
        data['FullName'],
        data['workArea'],
        data['phoneNO'],
        data['email'],
        data['jopType'],
        data['company'],
        data['id'],
      ]);
  }

  DeleteData(table, cardID)async{
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $cardID");
  }
}