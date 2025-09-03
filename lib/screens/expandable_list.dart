import 'package:flutter/material.dart';
import 'package:widgets_test/data/data.dart';
import 'package:widgets_test/entities/entities.dart';

class ExpandableList extends StatelessWidget {
  static const name = 'expandable_list';

  const ExpandableList({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ExpansionPanelData.generateItems(100);

    return Scaffold(
      appBar: AppBar(title: const Text('Expandable List')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = data[index];
          return _ExpandableListItem(item: item);
        },
        itemCount: data.length,
        cacheExtent: 500,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
      ),
    );
  }
}

class _ExpandableListItem extends StatelessWidget {
  final ExpansionItem item;

  const _ExpandableListItem({required this.item});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          ExpansionTile(
            shape: const Border(),
            title: Text('Item ${item.header}'),
            children:
                item.children
                    .map(
                      (child) => ListTile(
                        title: Text(child.title),
                        dense: true, // Reduces height for better performance
                      ),
                    )
                    .toList(),
          ),

          const Divider(height: 1, thickness: 1, indent: 10, endIndent: 10),
        ],
      ),
    );
}
