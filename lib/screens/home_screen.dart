import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/data/data.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Widgets test'), centerTitle: true),
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
