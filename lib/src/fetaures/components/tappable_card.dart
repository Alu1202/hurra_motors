import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {

  const TappableCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(12),
    this.color,
    this.borderRadius = 16,
    this.elevation = 2,
  });
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Color? color;
  final double borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).cardColor,
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
