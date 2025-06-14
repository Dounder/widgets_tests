import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/blocs/blocs.dart';

class NestedScreenHeader extends StatelessWidget {
  const NestedScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final cubit = context.watch<NestedNavigationCubit>();
    final colors = Theme.of(context).colorScheme;

    return SliverPersistentHeader(
      floating: true,
      delegate: _NestedScreenHeaderDelegate(
        minHeight: mediaQuery.height * cubit.state.snapSizes.first,
        maxHeight: mediaQuery.height * cubit.state.snapSizes.first,
        child: ColoredBox(
          color: colors.primaryContainer,
          child: Row(
            children: [
              // Fixed-width back button area
              SizedBox(
                width: 48,
                child:
                    context.canPop()
                        ? IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_ios_new),
                        )
                        : null,
              ),
              // Centered text
              Expanded(
                child: Center(
                  child: Text(
                    '${cubit.state.sheetSize.toStringAsPrecision(2)} - ${cubit.state.isCollapsed ? 'Collapsed' : 'Expanded'}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Fixed-width expand indicator area
              SizedBox(
                width: 48,
                child:
                    cubit.state.isCollapsed
                        ? const Icon(Icons.keyboard_arrow_up_rounded, size: 30)
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NestedScreenHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _NestedScreenHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      maxHeight != oldDelegate.maxExtent ||
      minHeight != oldDelegate.minExtent ||
      child != (oldDelegate as _NestedScreenHeaderDelegate).child;
}
