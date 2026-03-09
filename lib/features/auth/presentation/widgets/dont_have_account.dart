import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .center,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.register);
        },
        child: Text(
          "don't have account ?",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
