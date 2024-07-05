class ProductTable{
  static const String tableName = 'product';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String image = 'image';
  static const String createdTime = 'created_time';

  static const List<String> values = [
    id,
    title,
    description,
    image,
    createdTime,
  ];



}