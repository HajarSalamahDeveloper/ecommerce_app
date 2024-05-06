import 'package:floor/floor.dart';

@Entity(tableName: 'Favorite')
class FavoriteModel {
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final String images; // Change type to String
  bool isFavorite;

  FavoriteModel({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.price = 0.0,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    this.brand = "",
    this.category = "",
    this.thumbnail = "",
    this.images = "", // Update parameter
    this.isFavorite = false,
  });

  // Deserialize the 'images' string to a List<String>
  List<String> getImagesList() {
    return images.split(',');
  }
}
