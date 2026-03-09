import 'package:auth_token_managment/core/services/prefs.dart';
import 'package:auth_token_managment/core/services/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_token_managment.dart';
import 'core/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupServiceLocator();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit()..getCurrentTheme(),
      child: const AuthTokenManagment(),
    ),
  );
}
