import 'package:floor/floor.dart';

import '../../model/favorite_model.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM Favorite')
  Future<List<FavoriteModel>> getAllProducts();

  @Query('SELECT * FROM Favorite WHERE id = :id')
  Future<FavoriteModel?> getProductById(int id);
  @Query('SELECT * FROM Favorite WHERE isFavorite = :isFav')
  Future<FavoriteModel?> getProductByIsFavorite(bool isFav);

  @insert
  Future<void> insertFavorite(FavoriteModel product);

  @update
  Future<void> updateFavorite(FavoriteModel product);

  @delete
  Future<void> deleteFavorite(FavoriteModel product);
}
