import 'package:prodt_task/home/model/response/news_list_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Helper class for managing SQLite database operations
class DatabaseHelper {
  // Singleton instance of DatabaseHelper
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._(); // Private constructor to prevent direct instantiation

  factory DatabaseHelper() =>
      _instance; // Factory constructor to return the singleton instance

  // Getter for accessing the database instance asynchronously
  Future<Database> get database async {
    if (_database != null)
      return _database!; // Return existing database if available
    _database = await initDatabase(); // Otherwise, initialize the database
    return _database!; // Return the initialized database
  }

  // Method to initialize the database
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(),
        'news_database.db'); // Define the database path
    return await openDatabase(path,
        version: 1, onCreate: _createDb); // Open the database
  }

  // Method to create the database table
  Future<void> _createDb(Database db, int version) async {
    try {
      // Execute SQL command to create the 'news' table if it doesn't exist
      await db.execute('''
        CREATE TABLE news (
          id TEXT PRIMARY KEY,
          author TEXT,
          title TEXT,
          content TEXT,
          date TEXT,
          time TEXT,
          imageUrl TEXT,
          readMoreUrl TEXT,
          url TEXT
        );
      ''');
    } catch (e) {
      // Print error message if table creation fails
      print("Error creating table: $e");
    }
  }

  // Method to insert a datum into the database
  Future<void> insertDatum(Datum datum) async {
    final db = await database;
    // Insert the datum into the 'news' table, replacing existing data if conflict occurs
    await db.insert('news', datum.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Record added to database");
  }

  // Method to retrieve all bookmarks from the database
  Future<List<Datum>> getBookmarks() async {
    final db = await database;
    // Query the 'news' table and retrieve all rows
    final List<Map<String, dynamic>> maps = await db.query('news');
    // Convert the retrieved maps into Datum objects and return them as a list
    return List.generate(maps.length, (i) {
      return Datum.fromJson(maps[i]);
    });
  }

  // Method to remove a bookmark from the database based on its ID
  Future<void> removeBookmark(String id) async {
    final db = await database;
    // Delete the row from the 'news' table where the ID matches the provided ID
    await db.delete('news', where: 'id = ?', whereArgs: [id]);
    print("Bookmark removed from database");
  }
}
