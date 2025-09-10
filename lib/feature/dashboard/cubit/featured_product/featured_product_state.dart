part of 'featured_product_cubit.dart';

enum ProductStatus { initial, loading, success, failure }

class FeaturedProductState {
  final List<Product> product;
  final ProductStatus status;

  FeaturedProductState({required this.product, required this.status});

  FeaturedProductState copyWith({List<Product>? product, ProductStatus? status}) {
    return FeaturedProductState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }
}
