import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_best_project/src/app.dart';
import 'package:shop_best_project/src/core/bloc/user/user_bloc.dart';
import 'package:shop_best_project/src/core/di/di.dart';
import 'package:shop_best_project/src/core/theme/bloc/theme_bloc.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/bloc/product/product_bloc.dart';

void main() {
  initMock();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl.get<ThemeBloc>()..add(GetThemeMode()),
      ),
      BlocProvider(
        create: (context) => sl.get<UserBloc>()..add(GetMyUser()),
      ),
      BlocProvider(
        create: (context) => sl.get<ProductBloc>(),
      ),
    ],
    child: const App(),
  ));
}
