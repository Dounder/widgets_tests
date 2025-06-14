import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/blocs/blocs.dart';
import 'package:widgets_test/screens/screens.dart';
import 'package:widgets_test/widgets/widgets.dart';

class NestedScreenThree extends StatelessWidget {
  static const name = 'nested_screen_three';

  const NestedScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController =
        context.watch<NestedNavigationCubit>().scrollController;

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          NestedScreenHeader(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.emoji_events,
                    size: 120,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Journey Complete!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Congratulations! You\'ve reached the end of your adventure.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => context.goNamed(NestedScreenOne.name),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Start a New Journey',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
