import 'package:flutter_form_picker/post_form_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'postform.db';
  static const _databaseVersion = 1;

  static const table = 'postform_table';

  static const columnId = 'id';
  static const columnCoverImagePath = 'coverImagePath';
  static const columnPublishDate = 'publishDate';
  static const columnColorThemeValue = 'colorThemeValue';
  static const columnCaption = 'caption';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnCoverImagePath TEXT NOT NULL,
            $columnPublishDate TEXT NOT NULL,
            $columnColorThemeValue INTEGER NOT NULL,
            $columnCaption TEXT NOT NULL
          )
          ''');
  }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(PostFormModel postFormModel) async {
    Database? db = await instance.database;
    return await db!.insert(table, {
      'coverImagePath': postFormModel.coverImagePath,
      'publishDate': postFormModel.publishDate,
      'colorThemeValue': postFormModel.colorThemeValue,
      'caption': postFormModel.caption,
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
}
