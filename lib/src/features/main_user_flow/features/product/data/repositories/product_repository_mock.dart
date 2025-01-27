import 'package:shop_best_project/src/features/main_user_flow/features/product/data/models/product_model.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryMock implements ProductRepository {
  @override
  Future<List<ProductModel>> getRecomendedProducts({required int page}) async {
    await Future.delayed(Duration(milliseconds: 1500));

    List<ProductModel> products = List.generate(
      30,
      (index) => ProductModel.mock(),
    );

    return products;
  }
}
