import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/data/models/product_model.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._productRepository) : super(ProductStateInitial()) {
    on<GetRecommendedProducts>((event, emit) async {
      emit(ProductStateLoading());
      try {
        List<ProductModel> products = await _productRepository
            .getRecomendedProducts(page: event.pageNumber);

        emit(ProductStateSuccess(products: products));
      } catch (e) {}
    });
  }

  final ProductRepository _productRepository;
}
