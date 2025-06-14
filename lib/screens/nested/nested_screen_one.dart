import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/blocs/blocs.dart';
import 'package:widgets_test/screens/screens.dart';
import 'package:widgets_test/widgets/widgets.dart';

class NestedScreenOne extends StatelessWidget {
  static const name = 'nested_screen_one';

  const NestedScreenOne({super.key});

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
              padding: const EdgeInsets.symmetric(
                vertical: 60.0,
                horizontal: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.explore_outlined,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Begin Your Journey',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Discover new adventures and experiences that await you',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => context.pushNamed(NestedScreenTwo.name),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Start Exploring',
                      style: TextStyle(fontSize: 18),
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
