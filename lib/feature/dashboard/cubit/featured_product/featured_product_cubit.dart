import 'package:bloc/bloc.dart';
import 'package:gem_store/feature/dashboard/model/featured_product.dart';
import 'package:gem_store/feature/dashboard/repository/featured_product_repo.dart';

part 'featured_product_state.dart';

class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  final FeaturedProductRepo repo;
  FeaturedProductCubit(this.repo)
      : super(
          FeaturedProductState(status: ProductStatus.initial, featuredProduct: [], recommendedProduct: []),
        );

  void getFeaturedProducts() {
    final product = repo.getFeaturedProducts();
    emit(state.copyWith(featuredProduct: product));
  }

  void getRecommendedProducts() {
    final product = repo.getRecommendedProducts();
    emit(state.copyWith(recommendedProduct: product));
  }
}
