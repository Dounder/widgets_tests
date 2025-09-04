import 'package:flutter/material.dart';
import 'package:widgets_test/entities/entities.dart';
import 'package:widgets_test/screens/screens.dart';

final List<AppRoute> appRoutes = [
  const AppRoute(path: MapScreen.name, title: 'Map', icon: Icons.map),
  const AppRoute(
    path: ChartScreen.name,
    title: 'Charts',
    icon: Icons.show_chart_rounded,
  ),
  const AppRoute(
    path: ExpandableList.name,
    title: 'Expandable List',
    icon: Icons.list_rounded,
  ),
  const AppRoute(
    path: DraggableSheetScreen.name,
    title: 'Draggable Sheet',
    icon: Icons.drag_handle_rounded,
  ),
  const AppRoute(
    path: CustomTabsScreen.name,
    title: 'Custom Tabs',
    icon: Icons.tab_rounded,
  ),
  const AppRoute(
    path: NestedNavigationScreen.name,
    title: 'Nested Navigation',
    icon: Icons.picture_in_picture_alt_rounded,
  ),
];
