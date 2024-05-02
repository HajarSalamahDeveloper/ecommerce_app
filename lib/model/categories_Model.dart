class CategoryModel {
  final String name;

  CategoryModel({
    required this.name,
  });

  factory CategoryModel.fromJson(String json) {
    return CategoryModel(
      name: json,
    );
  }
}

class CategoryProducts {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  CategoryProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CategoryProducts.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> products = productList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return CategoryProducts(
      products: products,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Product {
  final int id;
  final String title;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
    );
  }
}
