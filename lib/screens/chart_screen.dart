import 'package:flutter/material.dart';
import 'package:widgets_test/data/data.dart';
import 'package:widgets_test/widgets/widgets.dart';

class ChartScreen extends StatelessWidget {
  static const name = 'chart_screen';

  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Chart Screen')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                const SizedBox(height: 10),

                Text(
                  'Line Chart with Multiple Data Sets',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomLineChart(
                  data: [ChartData.getMaxPoints(), ChartData.getNonMaxPoints()],
                  xAxisLabels: ChartData.getLabelsX(),
                ),

                const SizedBox(height: 10),
                Text(
                  'Line Chart with Single Data Set',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomLineChart(
                  data: [ChartData.getMaxPoints()],
                  xAxisLabels: ChartData.getLabelsX(),
                  barColor: colors.primary,
                ),

                const SizedBox(height: 10),
                Text(
                  'Segmented Bar Chart',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CustomSegmentedBar(
                  values: [20.0, 25.0, 15.0, 30.0, 10.0],
                  colors: [
                    colors.primary,
                    colors.secondary,
                    colors.tertiary,
                    colors.error,
                    colors.onSurface,
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
