import 'package:flutter/material.dart';
import 'path_node.dart';

import 'path_connector_painter.dart';

class LearningPathView extends StatelessWidget {
  final int itemCount;
  final int completedCount;
  final Function(int)? onNodeTap;

  const LearningPathView({
    super.key,
    this.itemCount = 10,
    this.completedCount = 0,
    this.onNodeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(itemCount, (index) {
        final bool isLast = index == itemCount - 1;
        
        return Column(
          children: [
            PathNode(
              index: index,
              isCompleted: index < completedCount,
              isLocked: index > completedCount,
              onTap: () => onNodeTap?.call(index),
            ),
            if (!isLast)
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomPaint(
                  painter: PathConnectorPainter(
                    isRightToLeft: index % 2 == 0,
                    color: index < completedCount ? BrandConfig.xpColor.withValues(alpha: 0.5) : Colors.grey[300]!,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
