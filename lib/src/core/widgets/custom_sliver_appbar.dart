import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Default tag used for Hero transitions.
const Object _tag = 'CUSTOM_APP_BAR';

/// A custom [SliverAppBar] that supports transition animations between two Hero widgets.
class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  /// Factory constructor that creates a [CustomSliverAppBar] with transition animation.
  ///
  /// This factory provides a custom implementation for handling Hero widget transitions,
  /// which can animate both the "from" and "to" widgets as they transition.
  ///
  /// - [tag]: The unique tag used for the Hero transition.
  /// - [maxExtent]: The maximum size of the header.
  /// - [minExtent]: The minimum size of the header.
  /// - [stretchConfiguration]: The configuration for overscroll stretching.
  /// - [builder]: The function used to build the widget for the app bar, given the current context and shrink offset.
  factory CustomSliverAppBar.transitionAnimation({
    required double maxExtent,
    required double minExtent,
    required OverScrollHeaderStretchConfiguration stretchConfiguration,
    required Widget Function(BuildContext context, double shrinkOffset,
            double maxExtent, double minExtent)
        builder,
    Object? tag,
  }) {
    return CustomSliverAppBar(
      tag: tag,
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        final Widget fromHero = fromHeroContext.widget;
        final Widget toHero = toHeroContext.widget;

        // Define the slide animation for the "from" widget during the transition.
        final fromHeroSlideAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: flightDirection == HeroFlightDirection.push
              ? const Offset(-1.0, 0.0)
              : const Offset(-1.0, 0.0),
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ));

        // Define the slide animation for the "to" widget during the transition.
        final toHeroSlideAnimation = Tween<Offset>(
          begin: flightDirection == HeroFlightDirection.push
              ? const Offset(1.0, 0.0)
              : const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ));

        // Return a stack with SlideTransition based on the flight direction.
        return Stack(
          children: flightDirection == HeroFlightDirection.push
              ? [
                  SlideTransition(
                    position: fromHeroSlideAnimation,
                    child: fromHero,
                  ),
                  SlideTransition(
                    position: toHeroSlideAnimation,
                    child: toHero,
                  ),
                ]
              : [
                  SlideTransition(
                    position: fromHeroSlideAnimation,
                    child: toHero,
                  ),
                  SlideTransition(
                    position: toHeroSlideAnimation,
                    child: fromHero,
                  ),
                ],
        );
      },
      builder: builder,
      maxExtent: maxExtent,
      minExtent: minExtent,
      stretchConfiguration: stretchConfiguration,
    );
  }

  /// Builds the app bar using the provided context, shrink offset, and whether it overlaps content.
  ///
  /// This method is responsible for creating the Hero widget, using the [flightShuttleBuilder]
  /// for managing the Hero transition animations.
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Hero(
      flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) =>
          flightShuttleBuilder(flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext),
      transitionOnUserGestures: true, // Enable transition on user gestures.
      tag: tag ?? _tag, // Use the provided tag or fallback to the default.
      child: Builder(
        builder: (context) =>
            builder(context, shrinkOffset, maxExtent, minExtent),
      ),
    );
  }

  @override
  final double maxExtent; // The maximum extent of the header.
  @override
  final double minExtent; // The minimum extent of the header.

  @override
  final OverScrollHeaderStretchConfiguration
      stretchConfiguration; // Configuration for overscroll stretching.

  final Widget Function(BuildContext context, double shrinkOffset,
          double maxExtent, double minExtent)
      builder; // The builder function for the app bar content.

  final Widget Function(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) flightShuttleBuilder; // The flight shuttle builder function for Hero animations.

  final Object? tag; // The unique tag used for Hero transitions.

  /// Constructor for the [CustomSliverAppBar] class.
  CustomSliverAppBar({
    this.tag = _tag,
    required this.maxExtent,
    required this.minExtent,
    required this.stretchConfiguration,
    required this.flightShuttleBuilder,
    required this.builder,
  });

  /// Returns whether the header should be rebuilt. Always returns true in this case.
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
