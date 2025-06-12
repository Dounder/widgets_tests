import 'package:equatable/equatable.dart';

class ExpansionItem extends Equatable {
  final String header;
  final List<ExpansionItemChild> children;
  final bool isExpanded;

  const ExpansionItem({
    required this.header,
    this.children = const [],
    this.isExpanded = false,
  });

  ExpansionItem copyWith({
    String? header,
    List<ExpansionItemChild>? children,
    bool? isExpanded,
  }) => ExpansionItem(
    header: header ?? this.header,
    children: children ?? this.children,
    isExpanded: isExpanded ?? this.isExpanded,
  );

  ExpansionItem toggleExpanded() => copyWith(isExpanded: !isExpanded);

  ExpansionItem setExpanded(bool expanded) => copyWith(isExpanded: expanded);

  @override
  List<Object?> get props => [header, children, isExpanded];
}

class ExpansionItemChild extends Equatable {
  final String title;
  final String subtitle;

  const ExpansionItemChild({required this.title, required this.subtitle});

  @override
  List<Object?> get props => [title, subtitle];
}
