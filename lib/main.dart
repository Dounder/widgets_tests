import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:widgets_test/blocs/blocs.dart';
import 'package:widgets_test/config/config.dart';

void main() {
  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => locator<ThemeCubit>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Widgets test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(darkMode: theme.isDarkMode).get(),
      routerConfig: appRouter,
    );
  }
}
