import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class CustomBarChart extends StatefulWidget {
  final ScreenshotController? screenshotController;
  final List<String>? xAxisLabels;
  final List<BarChartGroupData> data;

  const CustomBarChart({
    super.key,
    this.data = const [],
    this.screenshotController,
    this.xAxisLabels,
  });

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  late final ScreenshotController _localController;

  @override
  void initState() {
    super.initState();
    _localController = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.1,
      child: Screenshot(
        controller: widget.screenshotController ?? _localController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BarChart(_buildBarChartData(context)),
        ),
      ),
    );
  }

  BarChartData _buildBarChartData(BuildContext context) {
    return BarChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitlesData(),
      borderData: FlBorderData(show: false),
      barTouchData: BarTouchData(enabled: false),
      barGroups: widget.data,
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
