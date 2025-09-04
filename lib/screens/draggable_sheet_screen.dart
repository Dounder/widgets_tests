import 'package:flutter/material.dart';
import 'package:widgets_test/widgets/draggable_bottom_sheet.dart';

class DraggableSheetScreen extends StatelessWidget {
  static const name = 'draggable_sheet_screen';

  const DraggableSheetScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Nested Screen with Draggable Panel'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    body: Stack(
      children: [
        // Main content behind the panel
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.lightBlue],
            ),
          ),
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
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text('${index + 1}'),
                          ),
                          title: Text('Item ${index + 1}'),
                          subtitle: Text(
                            'This is the subtitle for item ${index + 1}',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Tapped on Item ${index + 1}'),
                              ),
                            );
                          },
                        ),
                      ),
                      childCount: 20,
                    ),
                  ),
                ),
              ],
        ),
      ],
    ),
  );
}
