part of 'nested_navigation_cubit.dart';

class NestedNavigationState extends Equatable {
  final double sheetSize;
  final List<double> snapSizes;
  final GoRouterState? goRouterState;

  bool get isCollapsed =>
      sheetSize.toPrecision(2) <= 0.05 ||
      sheetSize.toPrecision(2) == snapSizes.first;

  const NestedNavigationState({
    this.sheetSize = 0.5,
    this.snapSizes = const [0.1, 0.5, .9],
    this.goRouterState,
  });

  NestedNavigationState copyWith({
    double? sheetSize,
    List<double>? snapSizes,
    GoRouterState? goRouterState,
  }) => NestedNavigationState(
    sheetSize: sheetSize ?? this.sheetSize,
    snapSizes: snapSizes ?? this.snapSizes,
    goRouterState: goRouterState ?? this.goRouterState,
  );

  @override
  List<Object?> get props => [sheetSize, snapSizes, goRouterState];
}
