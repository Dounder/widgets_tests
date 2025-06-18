import 'package:flutter/material.dart';
import 'package:widgets_test/widgets/widgets.dart';

enum Filter { one, two, three }

class CustomTabsScreen extends StatefulWidget {
  static const name = 'custom_tabs_screen';

  const CustomTabsScreen({super.key});

  @override
  State<CustomTabsScreen> createState() => _CustomTabsScreenState();
}

class _CustomTabsScreenState extends State<CustomTabsScreen> {
  Filter selectedFilter = Filter.one;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Tabs Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Custom Segmented Control
            CustomSegmentedControl<Filter>(
              options: Filter.values,
              selectedValue: selectedFilter,
              onChanged: (filter) => setState(() => selectedFilter = filter),
              labelBuilder: (filter) => _getFilterLabel(filter),
            ),

            const SizedBox(height: 40),

            // Content based on selection
            Expanded(
              child: Center(
                child: Text(
                  'Selected: ${_getFilterLabel(selectedFilter)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFilterLabel(Filter filter) => switch (filter) {
    Filter.one => 'Filter One',
    Filter.two => 'Filter Two',
    Filter.three => 'Filter Three',
  };
}
