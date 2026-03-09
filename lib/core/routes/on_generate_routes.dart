import 'package:auth_token_managment/core/services/setup_service_locator.dart';
import 'package:auth_token_managment/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'app_routes.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => AuthCubit(getIt.get()),
          child: const LoginScreen(),
        ),
      );
    case AppRoutes.register:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => AuthCubit(getIt.get()),

          child: const RegisterScreen(),
        ),
      );
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text("there is no route with path : ${settings.name}"),
          ),
        ),
      );
  }
}
