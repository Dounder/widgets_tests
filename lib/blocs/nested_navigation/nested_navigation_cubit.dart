import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';

part 'nested_navigation_state.dart';

class NestedNavigationCubit extends Cubit<NestedNavigationState> {
  late DraggableScrollableController _draggableController;
  ScrollController? _scrollController;

  ScrollController? get scrollController => _scrollController;
  DraggableScrollableController get draggableController => _draggableController;

  NestedNavigationCubit() : super(const NestedNavigationState()) {
    newDraggableController();
  }

  void newDraggableController() =>
      _draggableController = DraggableScrollableController();

  void updateScrollController(ScrollController scrollController) =>
      _scrollController = scrollController;

  void onSheetChanged(double currentSize) =>
      emit(state.copyWith(sheetSize: currentSize));

  void updateRouterState(GoRouterState routerState) =>
      emit(state.copyWith(goRouterState: routerState));
}
