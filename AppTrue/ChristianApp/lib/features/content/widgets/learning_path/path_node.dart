import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../brand_config.dart';

class PathNode extends StatefulWidget {
  final int index;
  final bool isCompleted;
  final bool isLocked;
  final VoidCallback onTap;

  const PathNode({
    super.key,
    required this.index,
    this.isCompleted = false,
    this.isLocked = false,
    required this.onTap,
  });

  @override
  State<PathNode> createState() => _PathNodeState();
}

class _PathNodeState extends State<PathNode> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalOffset = (widget.index % 2 == 0) ? 40 : -40;
    final bool isActive = !widget.isCompleted && !widget.isLocked;

    return Padding(
      padding: EdgeInsets.only(
        left: horizontalOffset > 0 ? horizontalOffset : 0, 
        right: horizontalOffset < 0 ? -horizontalOffset : 0,
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, isActive ? -_animation.value : 0),
            child: child,
          );
        },
        child: GestureDetector(
          onTap: () {
            if (!widget.isLocked) {
              HapticFeedback.lightImpact();
              widget.onTap();
            }
          },
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  if (isActive)
                    // Pulse effect for active node
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BrandConfig.primaryColor.withValues(alpha: 0.2),
                      ),
                    ),
                  // Outer circle (shadow/border)
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isLocked 
                        ? Colors.grey[300] 
                        : widget.isCompleted ? BrandConfig.xpColor : BrandConfig.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          offset: const Offset(0, 6),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                  ),
                  // Inner circle
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isLocked 
                        ? Colors.grey[400] 
                        : widget.isCompleted ? BrandConfig.xpColor.withValues(alpha: 0.8) : BrandConfig.primaryColor.withValues(alpha: 0.8),
                    ),
                    child: Icon(
                      widget.isLocked ? Icons.lock : (widget.isCompleted ? Icons.check : Icons.play_arrow),
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Lesson ${widget.index + 1}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.isLocked ? Colors.grey : BrandConfig.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
