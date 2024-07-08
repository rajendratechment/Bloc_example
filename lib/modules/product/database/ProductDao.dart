import 'dart:async';

import 'package:bloc_ar/modules/product/database/table/ProductTable.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/Product.dart';

class ProductDao {
  static final ProductDao instance = ProductDao._internal();

  ProductDao._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'products.db');
    return await openDatabase(
      path,
      version: 1,
      password: dotenv.env['VAR_PASSWORD'],
      onCreate: ProductTable.createTable,
    );
  }

  Future<Product> create(Product product) async {
    final db = await instance.database;

    final id =
        await db.insert(ProductTable.tableName, product.toJsonForTable());
    return product.copy(id: id);
  }

  Future<Product> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      ProductTable.tableName,
      columns: ProductTable.values,
      where: '${ProductTable.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Product.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Product>> readAll() async {
    final db = await instance.database;
    const orderBy = '${ProductTable.createdTime} DESC';
    final result = await db.query(ProductTable.tableName, orderBy: orderBy);
    return result.map((json) => Product.fromJsonForTable(json)).toList();
  }

  Future<int> update(Product note) async {
    final db = await instance.database;
    return db.update(
      ProductTable.tableName,
      note.toJson(),
      where: '${ProductTable.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      ProductTable.tableName,
      where: '${ProductTable.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
