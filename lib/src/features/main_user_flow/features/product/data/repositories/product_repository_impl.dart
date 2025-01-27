import 'package:shop_best_project/src/features/main_user_flow/features/product/data/models/product_model.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductModel>> getRecomendedProducts({required int page}) {
    // TODO: implement getRecomendedProducts
    throw UnimplementedError();
  }
}
