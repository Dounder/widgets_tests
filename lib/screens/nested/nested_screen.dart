import 'package:flutter/material.dart';
import 'package:widgets_test/config/config.dart';
import 'package:widgets_test/widgets/widgets.dart';

class NestedScreen extends StatelessWidget {
  static const name = 'nested_screen';

  const NestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: NestedNavigatorSheet(
          containerChild: const Center(
            child: Text(
              'This is the main nested screen.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          config: nestedRouter,
        ),
      ),
    );
  }
}
