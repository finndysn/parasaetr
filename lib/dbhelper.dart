//  import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// class DbHelper {
// static const dbname = 'contactss';
// static const dbVersion= 2;
// static const tbname = 'contacts';
// static const colID = 'ids';
// static const colfName = 'fnames';
// static const collName = 'Inames'; // create database

// static Future<Database> openDB() async{
// var path=join(await getDatabasesPath(),dbname);
// return openDatabase(path,version: dbVersion, onCreate: (db, version) { db.execute('''
// CREATE TABLE $tbname (
// ''');
// $colID INTEGER PRIMARY KEY AUTOINCREMENT,
// $colFName TEXT,
// $colLName TEXT
// print('databased created');
// }
// }, );
// // insert
// static void insertData(Person p) async{
// final db=await openDB();
// var id= await db.insert(
// tbname,p.toMap(),
// conflictAlgorithm:
// ConflictAlgorithm.replace
// );
// print('data inserted');
// }
// // fetch
// static Future fethData() async{
// final db-await openDB();
// return await db.rawQuery('select * from $tbname');
// }
// }
