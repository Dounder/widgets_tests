import 'package:flutter/material.dart';
import 'package:widgets_test/entities/entities.dart';
import 'package:widgets_test/screens/screens.dart';

final List<AppRoute> appRoutes = [
  AppRoute(path: MapScreen.name, title: 'Map', icon: Icons.map),
  AppRoute(
    path: ChartScreen.name,
    title: 'Charts',
    icon: Icons.show_chart_rounded,
  ),
  AppRoute(
    path: ExpandableList.name,
    title: 'Expandable List',
    icon: Icons.list_rounded,
  ),
  AppRoute(
    path: NestedScreen.name,
    title: 'Nested Screen',
    icon: Icons.picture_in_picture_alt_rounded,
  ),
];
