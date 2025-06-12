import 'package:widgets_test/entities/entities.dart';

class ExpansionPanelData {
  static List<ExpansionItem> generateItems([int numberOfItems = 10]) {
    return List<ExpansionItem>.generate(numberOfItems, (int index) {
      return ExpansionItem(
        header: 'This is item number $index',
        children: [
          ExpansionItemChild(
            title: 'Item $index',
            subtitle: 'Subtitle for item $index',
          ),
          ExpansionItemChild(
            title: 'Another item $index',
            subtitle: 'Another subtitle for item $index',
          ),
        ],
        isExpanded: index.isEven, // Example logic for expansion
      );
    });
  }
}
