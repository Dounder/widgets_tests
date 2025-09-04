import 'package:flutter/material.dart';
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: const Text('Go To'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
        ),
      ],
    ),
  );
}
