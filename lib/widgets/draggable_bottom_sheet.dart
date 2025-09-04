import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatelessWidget {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final List<Widget> Function(
    BuildContext context,
    ScrollController scrollController,
  )
  builder;
  final bool showDragHandle;

  const DraggableBottomSheet({
    super.key,
    required this.builder,
    this.initialChildSize = 0.4,
    this.minChildSize = 0.1,
    this.maxChildSize = 0.9,
    this.showDragHandle = true,
  });

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
    initialChildSize: initialChildSize,
    minChildSize: minChildSize,
    maxChildSize: maxChildSize,
    builder:
        (context, scrollController) => Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // Drag handle
              if (showDragHandle) const _BaseHeader(),
              // Content from builder
              ...builder(context, scrollController),
            ],
          ),
        ),
  );
}

class _BaseHeader extends StatelessWidget {
  const _BaseHeader();

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        width: 50,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    ),
  );
}
