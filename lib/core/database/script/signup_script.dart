class Script {
  //
  final saveUser = '''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        username TEXT,
        password TEXT
      )
    ''';
}
