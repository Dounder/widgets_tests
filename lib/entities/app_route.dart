import 'package:flutter/widgets.dart';

class AppRoute {
  final String path;
  final String title;
  final String? subtitle;
  final IconData? icon;

  const AppRoute({
    required this.path,
    required this.title,
    this.subtitle,
    this.icon,
  });

  AppRoute copyWith({
    String? path,
    String? title,
    String? subtitle,
    IconData? icon,
  }) {
    return AppRoute(
      path: path ?? this.path,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
    );
  }
}
