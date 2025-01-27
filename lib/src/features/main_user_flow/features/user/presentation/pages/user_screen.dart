import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/widgets/product_appbar.dart';

class UserScreen extends StatelessWidget {
  static const String path = '/user';
  static const String name = 'user';
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: ProductAppbar(
                  maxExtent: 500,
                  minExtent: 90,
                  stretchConfiguration: OverScrollHeaderStretchConfiguration(),
                  expandedMaxHeight: 500,
                  expandedDefaultHeight: 500)),
        ],
      ),
    );
  }
}
