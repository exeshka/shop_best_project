import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_best_project/gen/assets.gen.dart';
import 'package:shop_best_project/generated/l10n.dart';
import 'package:shop_best_project/src/core/bloc/user/user_bloc.dart';
import 'package:shop_best_project/src/core/theme/other_constants.dart';
import 'package:shop_best_project/src/core/theme/theme.dart';
import 'package:shop_best_project/src/core/widgets/buttons_widget.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/user/presentation/pages/user_screen.dart';

class ProductAppBarWidget extends StatelessWidget {
  final double shrinkOffset;
  final double minExtent;
  final double maxExtent;

  const ProductAppBarWidget({
    super.key,
    required this.shrinkOffset,
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic thresholds for opacity and position changes.
    final double fadeThreshold = 20;
    final double positionThreshold = 40;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background with blur and dynamic color based on scroll offset.
              Positioned.fill(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      color: Color.lerp(context.bgColor, context.onBgColor,
                          shrinkOffset / maxExtent),
                    ),
                  ),
                ),
              ),

              // Profile button with dynamic opacity.
              Positioned(
                top: kToolbarHeight,
                left: 16,
                bottom: 0,
                child: AnimatedOpacity(
                  duration: duration,
                  opacity: shrinkOffset > fadeThreshold ? 0.0 : 1.0,
                  child: Builder(
                    builder: (context) {
                      if (userState is UserStateSuccess) {
                        return ButtonsWidget.scale(
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
                      } else {
                        return Container(color: Colors.red);
                      }
                    },
                  ),
                ),
              ),

              // Search bar with dynamic position.
              AnimatedPositioned(
                duration: duration,
                bottom: shrinkOffset > positionThreshold ? 4 : 16,
                left: shrinkOffset > positionThreshold ? 50 : 16,
                right: shrinkOffset > positionThreshold ? 50 : 16,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.onBgColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.ciSearchMagnifyingGlass,
                          colorFilter: ColorFilter.mode(
                            context.appBarIconsColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          S.of(context).search,
                          style: context.regular16
                              .copyWith(color: context.secondTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Profile icon with dynamic position.
              AnimatedPositioned(
                duration: duration,
                left: shrinkOffset > positionThreshold ? 11 : -30,
                bottom: shrinkOffset > positionThreshold
                    ? (minExtent / 2) - kToolbarHeight + 13
                    : 16,
                child: ButtonsWidget.iconScale(
                  onTap: () {
                    GoRouter.of(context).pushNamed(UserScreen.name);
                  },
                  child: SvgPicture.asset(
                    Assets.svg.iconamoonProfileDuotone,
                    colorFilter: ColorFilter.mode(
                      context.appBarIconsColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              // Notification icon with fixed position.
              Positioned(
                right: 16,
                top: (minExtent / 2) + 4,
                child: SizedBox(
                  height: 40,
                  child: SvgPicture.asset(
                    Assets.svg.ciBell,
                    colorFilter: ColorFilter.mode(
                      context.appBarIconsColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// This widget creates a dynamic, customizable app bar that reacts to the user's scroll offset.
/// - The `shrinkOffset` determines how much the app bar has been scrolled.
/// - Colors, opacity, and positions adjust dynamically based on the scroll offset.
/// - The `BlocBuilder` listens to the `UserBloc` to display user-specific data.
///
/// Key Features:
/// 1. Dynamic thresholds for opacity and position changes to avoid hardcoding values.
/// 2. Smooth animations for transitions.
/// 3. Customizable with child widgets and localized strings.
