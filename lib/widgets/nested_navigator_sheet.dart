import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/blocs/blocs.dart';

class NestedNavigatorSheet extends StatefulWidget {
  static const name = 'nested_screen';

  final Widget? containerChild;
  final RouterConfig config;

  const NestedNavigatorSheet({
    super.key,
    this.containerChild,
    required this.config,
  });

  @override
  State<NestedNavigatorSheet> createState() => _NestedNavigatorSheetState();
}

class _NestedNavigatorSheetState extends State<NestedNavigatorSheet> {
  final _sheet = GlobalKey();
  late DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    context.read<NestedNavigationCubit>().onSheetChanged(currentSize);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<NestedNavigationCubit>();
    final screenSize = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          height:
              math.max(
                screenSize.height * 0.3,
                screenSize.height * (1 - cubit.state.sheetSize),
              ) +
              10,
          color: colors.primary,
          child: widget.containerChild,
        ),
        DraggableScrollableSheet(
          key: _sheet,
          initialChildSize: cubit.state.sheetSize,
          maxChildSize: cubit.state.snapSizes.last,
          minChildSize: cubit.state.snapSizes.first,
          expand: true,
          snap: true,
          snapSizes: cubit.state.snapSizes,
          controller: _controller,
          builder: (BuildContext context, ScrollController scrollController) {
            cubit.updateScrollController(scrollController);
            cubit.updateRouterState(GoRouter.of(context).state);

            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Material(
                color: colors.surface,
                child: Router.withConfig(config: widget.config),
              ),
            );
          },
        ),
      ],
    );
  }
}
