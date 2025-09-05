import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/screens/screens.dart';
import 'package:widgets_test/widgets/widgets.dart';

class NestedNavigationScreen extends StatelessWidget {
  static const name = 'nested_navigation_screen';

  const NestedNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Nested Navigation')),
    body: Stack(
      children: [
        // Main content behind the panel
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.touch_app, size: 80, color: Colors.white),
                SizedBox(height: 16),
                Text(
                  'Pull up the panel below!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Draggable panel using the reusable widget
        DraggableBottomSheet(
          builder:
              (context, scrollController) => [
                const SliverToBoxAdapter(child: _NestedNavigationBody()),
              ],
        ),
      ],
    ),
  );
}

class _NestedNavigationBody extends StatelessWidget {
  const _NestedNavigationBody();

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: Capture the parent context BEFORE entering Router.withConfig
    // This gives us access to the main app's router
    final parentContext = context;

    return Router.withConfig(
      config: GoRouter(
        initialLocation: '/home',
        routes: [
          GoRoute(
            path: '/home',
            builder:
                (context, state) => Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(
                    child: _CustomCard(
                      title: 'Nested Home',
                      onTap: () => context.go('/details'),
                    ),
                  ),
                ),
          ),
          GoRoute(
            path: '/details',
            builder:
                (context, state) => Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: _CustomCard(
                      title: 'Nested Details',
                      onTap: () => context.go('/settings'),
                    ),
                  ),
                ),
          ),
          GoRoute(
            path: '/settings',
            builder:
                (context, state) => Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _CustomCard(
                            title: 'Nested Settings',
                            onTap: () => context.go('/home'),
                          ),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 8),
                          const Text(
                            'Navigate to Main Router:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Navigation buttons
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () => parentContext.go('/'),
                              icon: const Icon(Icons.home),
                              label: const Text('Main Home Screen'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed:
                                      () => parentContext.pushNamed(
                                        MapScreen.name,
                                      ),
                                  icon: const Icon(Icons.map, size: 18),
                                  label: const Text('Map'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed:
                                      () => parentContext.pushNamed(
                                        ChartScreen.name,
                                      ),
                                  icon: const Icon(Icons.show_chart, size: 18),
                                  label: const Text('Chart'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _CustomCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    ),
  );
}
