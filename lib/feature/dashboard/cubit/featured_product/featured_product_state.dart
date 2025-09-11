part of 'featured_product_cubit.dart';

enum ProductStatus { initial, loading, success, failure }

class FeaturedProductState {
  final List<Product> featuredProduct;
  final List<Product> recommendedProduct;
  final ProductStatus status;

  FeaturedProductState({required this.featuredProduct, required this.recommendedProduct, required this.status});

  FeaturedProductState copyWith(
      {List<Product>? featuredProduct, List<Product>? recommendedProduct, ProductStatus? status}) {
    return FeaturedProductState(
      featuredProduct: featuredProduct ?? this.featuredProduct,
      recommendedProduct: recommendedProduct ?? this.recommendedProduct,
      status: status ?? this.status,
    );
  }
}
