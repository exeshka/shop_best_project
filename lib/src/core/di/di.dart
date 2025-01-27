import 'package:get_it/get_it.dart';
import 'package:shop_best_project/src/core/bloc/user/user_bloc.dart';
import 'package:shop_best_project/src/core/repository/data/repository/user_repository_mock.dart';
import 'package:shop_best_project/src/core/repository/domain/repository/user_repository.dart';
import 'package:shop_best_project/src/core/theme/bloc/theme_bloc.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/data/repositories/product_repository_mock.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/domain/repositories/product_repository.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/bloc/product/product_bloc.dart';

GetIt sl = GetIt.I;

void init() {}

void initMock() {
  // REPOSITORY

  sl.registerSingleton<UserRepository>(UserRepositoryMock());

  sl.registerSingleton<ProductRepository>(ProductRepositoryMock());

  // BLOC
  sl.registerSingleton(UserBloc(sl.get()));

  sl.registerSingleton(ThemeBloc());

  sl.registerSingleton(ProductBloc(sl.get()));
}
