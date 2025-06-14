import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/blocs/blocs.dart';
import 'package:widgets_test/screens/screens.dart';
import 'package:widgets_test/widgets/widgets.dart';

class NestedScreenTwo extends StatelessWidget {
  static const name = 'nested_screen_two';

  const NestedScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController =
        context.watch<NestedNavigationCubit>().scrollController;

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: CustomScrollView(
        cacheExtent: 500,
        controller: scrollController,
        slivers: [
          NestedScreenHeader(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.flag, color: Colors.green, size: 120),
                  const SizedBox(height: 20),
                  const Text(
                    'Almost There!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'You\'re at the final step of your journey. Just one more to go!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () => context.pushNamed(NestedScreenThree.name),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Continue to Final Step'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
