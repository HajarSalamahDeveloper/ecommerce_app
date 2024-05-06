import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../model/favorite_model.dart';
import 'favoriteDao.dart';

part 'app_data_base.g.dart';

@Database(version: 1, entities: [FavoriteModel])
abstract class AppDatabase extends FloorDatabase {
  FavoriteDao get favoriteDao;
}
