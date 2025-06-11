import 'package:flutter/material.dart';

class CustomSegmentedBar extends StatelessWidget {
  final List<double> values;
  final List<Color> colors;

  const CustomSegmentedBar({
    super.key,
    this.values = const [100],
    this.colors = const [Colors.orange],
  }) : assert(
         values.length == colors.length,
         'Values and colors must have the same length',
       );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Row(
        children: List.generate(values.length, (i) {
          final flex = (values[i] * 1000).toInt(); // for better precision
          final isSmallSegment = flex < 150; // threshold for "small" segments

          final percentageText = '${values[i].toStringAsFixed(1)}%';

          return Expanded(
            flex: flex,
            child: Tooltip(
              message: percentageText,
              waitDuration: const Duration(milliseconds: 500),
              preferBelow: false,
              child: Container(
                color: colors[i],
                height: 48,
                alignment: Alignment.center,
                child:
                    isSmallSegment
                        ? const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 16,
                        )
                        : FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Text(
                              percentageText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
