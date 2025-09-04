import 'package:go_router/go_router.dart';
import 'package:widgets_test/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: _buildRoutes());

List<RouteBase> _buildRoutes() => [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/map',
    name: MapScreen.name,
    builder: (context, state) => const MapScreen(),
  ),
  GoRoute(
    path: '/chart',
    name: ChartScreen.name,
    builder: (context, state) => const ChartScreen(),
  ),
  GoRoute(
    path: '/expandable_list',
    name: ExpandableList.name,
    builder: (context, state) => const ExpandableList(),
  ),
  GoRoute(
    path: '/draggable_sheet',
    name: DraggableSheetScreen.name,
    builder: (context, state) => const DraggableSheetScreen(),
  ),
  GoRoute(
    path: '/custom_tabs',
    name: CustomTabsScreen.name,
    builder: (context, state) => const CustomTabsScreen(),
  ),
  GoRoute(
    path: '/nested_navigation',
    name: NestedNavigationScreen.name,
    builder: (context, state) => const NestedNavigationScreen(),
  ),
];
