import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:widgets_test/entities/entities.dart';

class CustomLineChart extends StatefulWidget {
  final List<List<LineChartCoord>> data;
  final ScreenshotController? screenshotController;
  final List<String>? xAxisLabels;
  final Color barColor;

  const CustomLineChart({
    super.key,
    required this.data,
    this.screenshotController,
    this.xAxisLabels,
    this.barColor = Colors.blue,
  });

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  late final ScreenshotController _localController;

  @override
  void initState() {
    super.initState();
    _localController = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: 2.1,
      child: Screenshot(
        controller: widget.screenshotController ?? _localController,
        child: LineChart(_buildLineChartData(context)),
      ),
    );
  }

  LineChartData _buildLineChartData(BuildContext context) {
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitlesData(),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 10,
      lineTouchData: LineTouchData(enabled: false),
      lineBarsData: _buildLineBarsData(),
    );
  }

  List<LineChartBarData> _buildLineBarsData() {
    return List.generate(
      widget.data.length,
      (index) => _buildLineChartBarData(
        data: widget.data[index],
        showLine: index == 0,
        showAreaBelow: widget.data.length < 2,
      ),
    );
  }

  LineChartBarData _buildLineChartBarData({
    required List<LineChartCoord> data,
    bool showLine = true,
    bool showAreaBelow = false,
  }) {
    return LineChartBarData(
      spots: data.map((coord) => FlSpot(coord.x, coord.y)).toList(),
      isCurved: false,
      barWidth: showLine ? 3 : 0,
      color: widget.barColor,

      dotData: _buildDotData(data),
      belowBarData: _buildBelowBarData(showAreaBelow),
    );
  }

  FlDotData _buildDotData(List<LineChartCoord> data) {
    return FlDotData(
      show: true,
      getDotPainter: (spot, percent, barData, index) {
        final coord = data[index];
        return FlDotCirclePainter(
          radius: 4,
          color: coord.color,
          strokeWidth: 4,
          strokeColor: coord.color.withValues(alpha: 0.5),
        );
      },
    );
  }

  BarAreaData _buildBelowBarData(bool showAreaBelow) {
    return BarAreaData(
      show: showAreaBelow,
      color: widget.barColor.withValues(alpha: 0.1),
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawHorizontalLine: false,
      verticalInterval: 1,
      getDrawingVerticalLine:
          (value) => FlLine(
            color: Colors.grey.withValues(alpha: 0.3),
            strokeWidth: 0.5,
          ),
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: _buildBottomTitles(),
      leftTitles: _buildLeftTitles(),
    );
  }

  AxisTitles _buildBottomTitles() {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: (value, meta) => _buildBottomTitleWidget(value, meta),
      ),
    );
  }

  AxisTitles _buildLeftTitles() {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        reservedSize: 30,
        getTitlesWidget: (value, meta) => _buildLeftTitleWidget(value, meta),
      ),
    );
  }

  Widget _buildBottomTitleWidget(double value, TitleMeta meta) {
    final index = value.toInt();
    final hasLabel =
        widget.xAxisLabels != null && index < widget.xAxisLabels!.length;

    return SideTitleWidget(
      meta: meta,
      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
      space: 6,
      child: Text(
        hasLabel ? widget.xAxisLabels![index] : '',
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  Widget _buildLeftTitleWidget(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      space: 6,
      child:
          value % 2 == 0
              ? Text(
                value.toInt().toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              )
              : const SizedBox.shrink(),
    );
  }
}
