import 'package:auth_token_managment/core/routes/app_routes.dart';
import 'package:auth_token_managment/core/services/prefs.dart';
import 'package:auth_token_managment/core/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: Text("just Simple app", style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Column(
        spacing: 16,
        crossAxisAlignment: .center,
        children: [
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: .center,
            spacing: 16,
            children: [Text("change Theme"), ThemeSwitcher()],
          ),
          GestureDetector(
            onTap: () {
              Prefs.clear();
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            child: const Row(
              mainAxisAlignment: .center,
              spacing: 16,
              children: [Text("logout"), Icon(Icons.logout)],
            ),
          ),
        ],
      ),
    );
  }
}
