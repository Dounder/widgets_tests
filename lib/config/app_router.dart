import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:widgets_test/blocs/blocs.dart';
import 'package:widgets_test/config/locator.dart';
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
    GoRoute(
      path: '/expandable_list',
      name: ExpandableList.name,
      builder: (context, state) => const ExpandableList(),
    ),
    GoRoute(
      path: '/nested',
      name: NestedScreen.name,
      builder:
          (context, state) => BlocProvider(
            create: (_) => locator<NestedNavigationCubit>(),
            child: const NestedScreen(),
          ),
    ),
  ];
}

final nestedRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: NestedScreenOne.name,
      builder: (context, state) => NestedScreenOne(),
      routes: [
        GoRoute(
          path: 'two',
          name: NestedScreenTwo.name,
          builder: (context, state) => NestedScreenTwo(),
          routes: [
            GoRoute(
              path: 'three',
              name: NestedScreenThree.name,
              builder: (context, state) => NestedScreenThree(),
            ),
          ],
        ),
      ],
    ),
  ],
);
