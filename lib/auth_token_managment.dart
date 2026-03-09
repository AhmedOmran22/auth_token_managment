import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/constants.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/on_generate_routes.dart';
import 'core/services/prefs.dart';
import 'core/theme_cubit/theme_cubit.dart';

class AuthTokenManagment extends StatelessWidget {
  const AuthTokenManagment({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state,
            onGenerateRoute: onGenerateRoutes,
            initialRoute: getInitialRoute(),
          ),
        );
      },
    );
  }
}

String getInitialRoute() {
  if (Prefs.getString(kToken) != null) {
    return AppRoutes.home;
  } else {
    return AppRoutes.login;
  }
}
