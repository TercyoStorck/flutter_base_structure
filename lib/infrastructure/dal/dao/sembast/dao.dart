import 'dart:async';

import 'package:base_structure/infrastructure/dal/contracts/dao_contract.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

abstract class DAO implements DAOContract {
  static Completer<Database> _dbOpenCompleter;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'main.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }

  @protected
  String get storeName;
  @protected
  StoreRef get store => intMapStoreFactory.store(storeName);

  @override
  Future<void> clear() async {
    await store.delete(await this.database);
  }
}
