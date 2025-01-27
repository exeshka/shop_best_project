import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:shop_best_project/src/core/models/image_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String desc;
  final num price;
  final List<ImageModel> images;

  const ProductModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.price,
      required this.images});

  @override
  List<Object?> get props => [id, title, desc, price, images];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        price: json['price'],
        images: (json['images'] as List)
            .map(
              (e) => ImageModel.fromJson(e),
            )
            .toList());
  }

  factory ProductModel.mock() {
    List<ProductModel> mockProducts = [
      ProductModel(
          price: 750,
          desc: 'Описание',
          images: [
            ImageModel.mock(),
            ImageModel.mock(),
          ],
          id: 1,
          title: '1 Товар'),
      ProductModel(
          price: 750,
          desc: 'Описание',
          images: [
            ImageModel.mock(),
            ImageModel.mock(),
          ],
          id: 2,
          title: '2 Товар'),
    ];

    return mockProducts[math.Random().nextInt(mockProducts.length)];
  }
}
