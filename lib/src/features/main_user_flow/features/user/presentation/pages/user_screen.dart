import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_best_project/src/core/widgets/custom_sliver_appbar.dart';

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
              delegate: CustomSliverAppBar.transitionAnimation(
            maxExtent: 500,
            minExtent: 90,
            stretchConfiguration: OverScrollHeaderStretchConfiguration(),
            builder: (context, shrinkOffset) {
              return Container(
                color: Colors.red,
              );
            },
          )),
        ],
      ),
    );
  }
}
