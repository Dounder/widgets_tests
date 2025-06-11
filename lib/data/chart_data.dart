import 'dart:math';

import 'package:widgets_test/data/data.dart';
import 'package:widgets_test/entities/entities.dart';

const List<LineChartCoord> points = [
  LineChartCoord(
    x: 0,
    y: 10,
    labelX: '01/5',
    labelY: '10',
    color: ColorsData.severityVeryHigh,
  ),
  LineChartCoord(
    x: 0,
    y: 4,
    labelX: '01/5',
    labelY: '10',
    color: ColorsData.severityMedium,
  ),
  LineChartCoord(
    x: 1,
    y: 6,
    labelX: '08/5',
    labelY: '6',
    color: ColorsData.severityMedium,
  ),
  LineChartCoord(
    x: 1,
    y: 3,
    labelX: '08/5',
    labelY: '6',
    color: ColorsData.severityLow,
  ),
  LineChartCoord(
    x: 2,
    y: 7,
    labelX: '15/5',
    labelY: '7',
    color: ColorsData.severityHigh,
  ),
  LineChartCoord(
    x: 2,
    y: 2,
    labelX: '15/5',
    labelY: '7',
    color: ColorsData.severityLow,
  ),
  LineChartCoord(
    x: 3,
    y: 1,
    labelX: '22/5',
    labelY: '1',
    color: ColorsData.severityControlled,
  ),
  LineChartCoord(
    x: 4,
    y: 1,
    labelX: '29/5',
    labelY: '1',
    color: ColorsData.severityControlled,
  ),
];

class ChartData {
  static List<LineChartCoord> getPoints({bool maxOnly = false}) {
    if (maxOnly) {
      return getMaxPoints();
    }

    return points;
  }

  static List<LineChartCoord> getMaxPoints() {
    // Group points by x coordinate and find max y for each x
    final Map<double, LineChartCoord> maxPointsByX = {};

    for (var point in points) {
      if (!maxPointsByX.containsKey(point.x) ||
          point.y > maxPointsByX[point.x]!.y) {
        maxPointsByX[point.x] = point;
      }
    }

    // Sort by x coordinate and return list
    final sortedKeys = maxPointsByX.keys.toList()..sort();
    return sortedKeys.map((x) => maxPointsByX[x]!).toList();
  }

  static List<LineChartCoord> getNonMaxPoints() {
    final maxPoints = getMaxPoints();

    return points
        .where(
          (point) =>
              !maxPoints.any(
                (maxPoint) => maxPoint.x == point.x && maxPoint.y == point.y,
              ),
        )
        .toList();
  }

  static List<String> getLabelsX() {
    return points.map((e) => e.labelX).toSet().toList();
  }

  static List<double> getSegmentedBarValues() {
    final random = Random();
    // Generate random number of segments (1-5)
    final segmentCount = random.nextInt(5) + 1;

    // Create list with random values
    List<double> values = [];
    double remaining = 100.0;

    // Generate n-1 random values
    for (int i = 0; i < segmentCount - 1; i++) {
      // Get random portion of remaining value
      double maxPortion = remaining * 0.8; // Prevent tiny last segment
      double value = random.nextDouble() * maxPortion;
      value = double.parse(value.toStringAsFixed(1)); // Round to 1 decimal
      values.add(value);
      remaining -= value;
    }

    // Add final value to make sum exactly 100
    values.add(double.parse(remaining.toStringAsFixed(1)));

    return values;
  }
}
