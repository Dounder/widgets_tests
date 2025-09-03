import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatelessWidget {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Widget Function(
    BuildContext context,
    ScrollController scrollController,
  )?
  builder;
  final Widget? child;
  final Color backgroundColor;
  final Color? handleColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool showHandle;
  final double handleWidth;
  final double handleHeight;

  const DraggableBottomSheet({
    super.key,
    this.initialChildSize = 0.4,
    this.minChildSize = 0.1,
    this.maxChildSize = 0.9,
    this.builder,
    this.child,
    this.backgroundColor = Colors.white,
    this.handleColor,
    this.borderRadius,
    this.boxShadow,
    this.showHandle = true,
    this.handleWidth = 50,
    this.handleHeight = 5,
  }) : assert(
         (builder != null) ^ (child != null),
         'Either builder or child must be provided, but not both.',
       );

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
    initialChildSize: initialChildSize,
    minChildSize: minChildSize,
    maxChildSize: maxChildSize,
    builder:
        (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius:
                borderRadius ??
                const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow:
                boxShadow ??
                const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
          ),
          child: Column(
            children: [
              // Drag handle (optional)
              if (showHandle)
                Container(
                  width: handleWidth,
                  height: handleHeight,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: handleColor ?? Colors.grey[300],
                    borderRadius: BorderRadius.circular(handleHeight / 2),
                  ),
                ),
              // Content
              Expanded(
                child:
                    builder != null
                        ? builder!(context, scrollController)
                        : SingleChildScrollView(
                          controller: scrollController,
                          child: child!,
                        ),
              ),
            ],
          ),
        ),
  );
}
