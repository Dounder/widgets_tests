import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/blocs/blocs.dart';
import 'package:widgets_test/data/data.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets test'),
        actions: [
          IconButton(
            onPressed: theme.toggleTheme,
            icon: Icon(
              theme.state.isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: appRoutes.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final route = appRoutes[index];
                  return ListTile(
                    leading: route.icon != null ? Icon(route.icon) : null,
                    title: Text(route.title),
                    subtitle:
                        route.subtitle != null ? Text(route.subtitle!) : null,
                    onTap: () => context.pushNamed(route.path),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
