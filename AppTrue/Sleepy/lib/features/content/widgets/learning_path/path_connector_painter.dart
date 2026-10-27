import 'package:flutter/material.dart';

class PathConnectorPainter extends CustomPainter {
  final bool isRightToLeft;
  final Color color;
  final double strokeWidth;

  PathConnectorPainter({
    required this.isRightToLeft,
    required this.color,
    this.strokeWidth = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = Path();
    
    // Calculate bezier points for a smooth S-curve between nodes
    if (isRightToLeft) {
      path.moveTo(size.width * 0.8, 0);
      path.cubicTo(
        size.width * 0.8, size.height * 0.5, // Control point 1
        size.width * 0.2, size.height * 0.5, // Control point 2
        size.width * 0.2, size.height,       // End point
      );
    } else {
      path.moveTo(size.width * 0.2, 0);
      path.cubicTo(
        size.width * 0.2, size.height * 0.5, // Control point 1
        size.width * 0.8, size.height * 0.5, // Control point 2
        size.width * 0.8, size.height,       // End point
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
