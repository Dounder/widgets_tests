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

class _ScrollableChild extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;

  const _ScrollableChild({required this.scrollController, required this.child});

  @override
  Widget build(BuildContext context) {
    // If child is already scrollable, just return it
    if (child is ListView ||
        child is GridView ||
        child is CustomScrollView ||
        child is SingleChildScrollView) {
      return child;
    }

    // Otherwise, wrap in SingleChildScrollView with the controller
    return SingleChildScrollView(controller: scrollController, child: child);
  }
}

// Predefined sheet content widgets for common use cases

class ListSheet extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final ScrollController? scrollController;

  const ListSheet({
    super.key,
    required this.children,
    this.padding,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) => ListView(
    controller: scrollController,
    padding: padding ?? const EdgeInsets.all(16),
    children: children,
  );
}

class GridSheet extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const GridSheet({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.padding,
    this.scrollController,
    this.crossAxisSpacing = 8.0,
    this.mainAxisSpacing = 8.0,
  });

  @override
  Widget build(BuildContext context) => GridView.count(
    controller: scrollController,
    padding: padding ?? const EdgeInsets.all(16),
    crossAxisCount: crossAxisCount,
    crossAxisSpacing: crossAxisSpacing,
    mainAxisSpacing: mainAxisSpacing,
    children: children,
  );
}
