import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  final Widget child;
  final Function() onTap;

  const ButtonsWidget({super.key, required this.child, required this.onTap});

  factory ButtonsWidget.iconScale({
    required Function() onTap,
    required Widget child,
  }) {
    return ButtonsWidget(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(12)),
        height: 40,
        width: 40,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: onTap,
      child: child,
    );
  }
}

class ScaleButton extends StatefulWidget {
  final Widget child;
  final Function() onTap;

  const ScaleButton({super.key, required this.child, required this.onTap});

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> {
  static const double maxScale = 1.0;
  static const double minScale = 0.8;

  double currentScale = maxScale;

  void onPressDown() {
    setState(() {
      currentScale = minScale;
    });
  }

  void onPressUp() {
    setState(() {
      currentScale = maxScale;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => onPressDown(),
      onTapUp: (_) => onPressUp(),
      onTapCancel: () => onPressUp(),
      child: AnimatedScale(
        scale: currentScale,
        duration: const Duration(milliseconds: 100), // Длительность анимации
        curve: Curves.easeInOut, // Плавность анимации
        child: widget.child,
      ),
    );
  }
}
