import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/feature/dashboard/model/featured_product.dart';

class FeaturedProductRepo {
  final List<Product> _dummyProducts = [
    Product(id: '1', name: 'Turtleneck Sweater ', price: 79.99, image: Assets.featured_1),
    Product(id: '2', name: 'Long Sleeve Dress', price: 29.99, image: Assets.featured_2),
    Product(id: '3', name: 'Sportwear Set', price: 15.99, image: Assets.featured_3),
  ];

  List<Product> getProducts() => _dummyProducts;
}
