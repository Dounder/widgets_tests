import 'package:go_router/go_router.dart';
import 'package:widgets_test/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: _buildRoutes(),
  debugLogDiagnostics: false, // Disable debug logs in production
);

List<RouteBase> _buildRoutes() {
  return [
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
  ];
}
