import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LineChartCoord extends Equatable {
  final double x;
  final double y;
  final String labelX;
  final String labelY;
  final Color color;

  const LineChartCoord({
    required this.x,
    required this.y,
    this.labelX = '',
    this.labelY = '',
    this.color = Colors.white,
  });

  String getLabelFromX() => labelX.isNotEmpty ? labelX : x.toString();

  String getLabelFromY() => labelY.isNotEmpty ? labelY : y.toString();

  @override
  List<Object> get props => [x, y, labelX, labelY, color];
}
