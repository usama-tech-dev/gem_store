import 'package:bloc/bloc.dart';
import 'package:gem_store/feature/dashboard/model/featured_product.dart';
import 'package:gem_store/feature/dashboard/repository/featured_product_repo.dart';

part 'featured_product_state.dart';

class FeaturedProductCubit extends Cubit<FeaturedProductState> {
  final FeaturedProductRepo repo;
  FeaturedProductCubit(this.repo)
      : super(
          FeaturedProductState(status: ProductStatus.initial, product: []),
        );

  void getProduct() {
    final product = repo.getProducts();
    emit(state.copyWith(product: product));
  }
}
