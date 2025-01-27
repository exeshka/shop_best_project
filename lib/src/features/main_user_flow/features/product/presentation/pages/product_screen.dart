import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/data/models/product_model.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/bloc/product/product_bloc.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/widgets/product_appbar.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/widgets/product_card.dart';

import 'package:skeletonizer/skeletonizer.dart';

class ProductScreen extends StatefulWidget {
  static const path = "/";
  static const name = "product_screen";

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late Animation<double> _animationAppBarHeight;
  late AnimationController _animationControllerAppBarHeight;

  double expandedDefaultHeight = kToolbarHeight + 145;

  double expandedMaxHeight = kToolbarHeight + 310;
  double collapsedHeight = kToolbarHeight + 60;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(GetRecommendedProducts(pageNumber: 0));

    _animationControllerAppBarHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Более плавная анимация
    );

    _animationAppBarHeight = Tween<double>(
      begin: expandedDefaultHeight,
      end: expandedMaxHeight,
    ).animate(CurvedAnimation(
      parent: _animationControllerAppBarHeight,
      curve: Curves.linear,
    ));

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _scrollController.position.isScrollingNotifier.addListener(
          () {
            _onScrollEnd();
          },
        );
      },
    );

    super.initState();
  }

  void _onScrollEnd() {
    if (!_scrollController.position.isScrollingNotifier.value) {
      _handleSnapScroll();
    }
  }

  void _handleSnapScroll() {
    double offset = _scrollController.offset;

    // Задаем пороговое значение для диапазона
    double snapThreshold = (_animationAppBarHeight.value - collapsedHeight) / 2;

    // Если скролл выше минимального значения, остаемся развернутыми
    if (offset < snapThreshold) {
      _animateScrollTo(0.0); // Раскрыть шапку
    }
    // Если скролл выходит за диапазон, сворачиваем
    else if (offset >= snapThreshold &&
        offset < (expandedDefaultHeight - collapsedHeight)) {
      _animateScrollTo(expandedDefaultHeight - collapsedHeight);
    }
  }

  void _animateScrollTo(double offset) {
    Future.microtask(
      () {
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: ProductAppbar(
                  expandedDefaultHeight: expandedDefaultHeight,
                  expandedMaxHeight: expandedMaxHeight,
                  maxExtent: _animationAppBarHeight.value,
                  minExtent: collapsedHeight,
                  stretchConfiguration: OverScrollHeaderStretchConfiguration(
                    onStretchTrigger: () async {},
                  ))),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductStateSuccess) {
                return SliverPadding(
                  padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 32,
                      bottom: kBottomNavigationBarHeight + 16),
                  sliver: SliverGrid.builder(
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 186 / 240,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      productModel: state.products[index],
                    ),
                  ),
                );
              }

              if (state is ProductStateLoading) {
                return Skeletonizer.sliver(
                  containersColor: context.bgColor,
                  textBoneBorderRadius:
                      TextBoneBorderRadius(BorderRadius.circular(12)),
                  effect: ShimmerEffect(
                    baseColor: context.onBgColor,
                    highlightColor:
                        context.appTheme.primaryColor.withValues(alpha: 0.40),
                  ),
                  child: SliverPadding(
                    padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 32,
                        bottom: kBottomNavigationBarHeight + 16),
                    sliver: SliverGrid.builder(
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 186 / 240,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        productModel: ProductModel.mock(),
                        isLoading: true,
                      ),
                    ),
                  ),
                );
              }

              return SliverFillRemaining(
                hasScrollBody: false,
              );
            },
          )
        ],
      ),
    );
  }
}
