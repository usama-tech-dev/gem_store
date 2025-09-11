import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/feature/dashboard/model/featured_product.dart';

class FeaturedProductRepo {
  final List<Product> _featuredProducts = [
    Product(id: '1', name: 'Turtleneck Sweater ', price: 79.99, image: Assets.featured_1),
    Product(id: '2', name: 'Long Sleeve Dress', price: 29.99, image: Assets.featured_2),
    Product(id: '3', name: 'Sportwear Set', price: 15.99, image: Assets.featured_3),
  ];

  final List<Product> _recommendProducts = [
    Product(id: '1', name: 'White fashion hoodie ', price: 29.99, image: Assets.recommend_1),
    Product(id: '2', name: 'Cotton T-shirt', price: 29.99, image: Assets.recommend_2),
  ];

  List<Product> getFeaturedProducts() => _featuredProducts;
  List<Product> getRecommendedProducts() => _recommendProducts;
}
