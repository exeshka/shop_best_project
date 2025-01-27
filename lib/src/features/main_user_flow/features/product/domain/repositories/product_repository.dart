import 'package:shop_best_project/src/features/main_user_flow/features/product/data/models/product_model.dart';

abstract interface class ProductRepository {
  Future<List<ProductModel>> getRecomendedProducts({required int page});
}
