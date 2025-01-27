part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class GetRecommendedProducts extends ProductEvent {
  final int pageNumber;

  const GetRecommendedProducts({required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}
