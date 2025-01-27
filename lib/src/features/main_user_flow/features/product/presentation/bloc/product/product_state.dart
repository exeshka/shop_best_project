part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductStateInitial extends ProductState {}

final class ProductStateLoading extends ProductState {}

final class ProductStateEmpty extends ProductState {}

final class ProductStateError extends ProductState {
  final String error;

  const ProductStateError({required this.error});

  @override
  List<Object> get props => [error];
}

class ProductStateSuccess extends ProductState {
  final List<ProductModel> products;

  const ProductStateSuccess({required this.products});

  @override
  List<Object> get props => [products];
}
