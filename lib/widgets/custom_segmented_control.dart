import 'package:flutter/material.dart';

class CustomSegmentedControl<T extends Enum> extends StatelessWidget {
  final List<T> options;
  final T selectedValue;
  final ValueChanged<T> onChanged;
  final String Function(T)? labelBuilder;

  const CustomSegmentedControl({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: .3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: List.generate(options.length, (index) {
          final option = options[index];
          final isSelected = option == selectedValue;
          final label = labelBuilder?.call(option) ?? _defaultLabel(option);

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(option),
              child: AnimatedContainer(
                padding: const EdgeInsets.all(12),
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? colors.primary : colors.surfaceContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: isSelected ? colors.onPrimary : colors.onSurface,
                      fontSize: 16,
                    ),
                    child: Text(label),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  String _defaultLabel(T option) {
    // Convert enum name to a readable format
    final name = option.name;
    return name[0].toUpperCase() + name.substring(1);
  }
}
