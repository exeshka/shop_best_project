import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shop_best_project/src/core/models/image_model.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';
import 'package:shop_best_project/src/core/widgets/image_widget.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/data/models/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  final bool? isLoading;
  const ProductCard(
      {super.key, required this.productModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: context.bgColor, borderRadius: BorderRadius.circular(16)),
      // height: 240,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: context.onBgColor,
            ),
          )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Skeleton.leaf(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: context.bgColor,
                  height: 181,
                  child: isLoading!
                      ? nil
                      : ImageWidget(image: productModel.images.first),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: context.bgColor,
                height: 59,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.title,
                        style: context.meduim16,
                      ),
                      Text(
                        productModel.desc,
                        style: context.regular12,
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
