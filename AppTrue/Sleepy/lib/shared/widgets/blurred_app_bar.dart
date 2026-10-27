import 'dart:ui';
import 'package:flutter/material.dart';
import '../../brand_config.dart';

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final double height;

  const BlurredAppBar({
    super.key,
    required this.title,
    this.actions,
    this.height = 70.0,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            backgroundColor: BrandConfig.backgroundColor.withValues(alpha: 0.8),
            elevation: 0,
            centerTitle: false,
            title: title,
            actions: actions,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
