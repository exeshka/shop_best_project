import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_best_project/gen/assets.gen.dart';
import 'package:shop_best_project/generated/l10n.dart';
import 'package:shop_best_project/src/core/bloc/user/user_bloc.dart';
import 'package:shop_best_project/src/core/extension/extension.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';
import 'package:shop_best_project/src/core/widgets/buttons_widget.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/user/presentation/pages/user_screen.dart';

const double sigmaX = 50;
const double sigmaY = 50;

const Duration _duration = Duration(milliseconds: 150);

class ProductAppbar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return AnimatedContainer(
          duration: _duration,
          color: context.appTheme.onBgColor,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                    child: AnimatedContainer(
                      duration: _duration,
                      color: shrinkOffset > 80
                          ? context.onBgColor
                          : context.bgColor,
                    ),
                  ),
                ),
              ),

              // При скроле больше 40 плавно скрыть
              Positioned(
                top: kToolbarHeight,
                left: 16,
                bottom: 0,
                child: AnimatedOpacity(
                  duration: _duration,
                  opacity: shrinkOffset > 40 ? 0.0 : 1.0,
                  child: Builder(
                    builder: (context) {
                      switch (userState) {
                        case UserStateSuccess _:
                          return ButtonsWidget(
                            onTap: () {
                              GoRouter.of(context).pushNamed(UserScreen.name);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).profile,
                                  style: context.meduim14,
                                ),
                                Text(
                                  userState.userModel.userName,
                                  style: context.semiBold22,
                                ),
                              ],
                            ),
                          );
                        default:
                          return Container(
                            color: Colors.red,
                          );
                      }
                    },
                  ),
                ),
              ),

              AnimatedPositioned(
                  duration: _duration,
                  bottom: 16,
                  left: shrinkOffset > 40 ? 50 : 16,
                  right: shrinkOffset > 40 ? 50 : 16,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: context.onBgColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.svg.ciSearchMagnifyingGlass,
                              colorFilter: ColorFilter.mode(
                                  context.appBarIconsColor, BlendMode.srcIn)),
                          8.widthBox,
                          Text(
                            context.s.search,
                            style: context.regular16
                                .copyWith(color: context.secondTextColor),
                          ),
                        ],
                      ),
                    ),
                  )),

              AnimatedPositioned(
                duration: _duration,
                left: shrinkOffset > 40 ? 16 : -30,
                bottom: 16,
                child: ButtonsWidget.iconScale(
                  onTap: () {
                    GoRouter.of(context).pushNamed(UserScreen.name);
                  },
                  child: SvgPicture.asset(
                    Assets.svg.iconamoonProfileDuotone,
                    colorFilter: ColorFilter.mode(
                        context.appBarIconsColor, BlendMode.srcIn),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: _duration,
                right: 16,
                top: kToolbarHeight + 3,
                child: SizedBox(
                  height: 40,
                  child: SvgPicture.asset(
                    Assets.svg.ciBell,
                    colorFilter: ColorFilter.mode(
                        context.appBarIconsColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  final double maxExtent;
  @override
  final double minExtent;

  @override
  final OverScrollHeaderStretchConfiguration? stretchConfiguration;

  final double expandedMaxHeight;
  final double expandedDefaultHeight;

  ProductAppbar(
      {required this.maxExtent,
      required this.minExtent,
      required this.stretchConfiguration,
      required this.expandedMaxHeight,
      required this.expandedDefaultHeight});

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
