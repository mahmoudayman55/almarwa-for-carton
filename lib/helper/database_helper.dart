import 'package:alsafwa/constants/database_constants.dart';
import 'package:alsafwa/models/material_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();
  Database? _database;

  Future<Database?> get database async {
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    //create db file and save it
    String databasePath = join(await getDatabasesPath(), 'almarwa.db');
    print('database created $databasePath');
    return openDatabase(databasePath, version: 1, // open database (almarwa.db)
        onCreate: (Database db, int version) async {
      //create materials table
      try {
        await db.execute(
            '''CREATE TABLE $materialsTableName(
             $materialIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
             $materialNameColumn TEXT NOT NULL,
             $materialPriceColumn REAL NOT NULL,
             $materialWeightColumn REAL NOT NULL)''');
        print('table created');
      }
      catch (error) {
        Get.snackbar('error', error.toString());
      }

      db.close();
    });
  }

  insertMaterial(MaterialModel material) async {
    //insert new material
    var dbClient = _database;
    if (dbClient != null)
      try {
        await dbClient.insert(materialsTableName, material.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
        print('asdasdasd');

      } catch (error) {
        Get.snackbar('Error insert', error.toString());
      }
  }





  updateMaterialName(String columnName, var value, int materialId) async {
    //update specific material attribute with value
    // (The attribute to be modified can be selected by methods parameters)
    var dbClient = _database;
    if (dbClient != null)
      try {
        await dbClient.execute(
            '''UPDATE $materialsTableName SET $columnName = $value WHERE $materialIdColumn = $materialId  ''');
      } catch (error) {
        Get.snackbar('Error', error.toString());
      }
  }



  deleteMaterial(int materialId) async {
    var dbClient = _database;
    if (dbClient != null)
      try {
        await dbClient.delete(materialsTableName,
            where: '$materialIdColumn=?', whereArgs: [materialId]);
      } catch (error) {
        Get.snackbar('Error', error.toString());
      }
  }

  Future<List<MaterialModel>> findMaterial(var searchWord) async {
    var dbClient = _database;
    if (dbClient != null) {
      try {
        List<Map<String, dynamic>> relatedMaterials =
            await dbClient.query('''$materialsTableName WHERE
             $materialIdColumn like '%$searchWord%' OR
             $materialPriceColumn like '%$searchWord%' OR 
             $materialNameColumn like '%$searchWord%' OR
             $materialWeightColumn like '%$searchWord%'  ''');
        return relatedMaterials
            .map((material) => MaterialModel.fromJson(material))
            .toList();
      } catch (error) {
        Get.snackbar('Error', error.toString());
        return [];
      }

    }
    else return [];

  }



  Future<List<MaterialModel>> getAllMaterials() async {
    var dbClient = _database;
    if (dbClient != null) {
      try {
        List<Map<String, dynamic>> relatedMaterials =
            await dbClient.query(materialsTableName);

        return relatedMaterials
            .map((material) => MaterialModel.fromJson(material))
            .toList();
      } catch (error) {
        Get.snackbar('Error3', error.toString());

        return [];
      }

    }
    else return [];

  }
}
