import 'package:auth_token_managment/core/routes/app_routes.dart';
import 'package:auth_token_managment/core/utils/app_assets.dart';
import 'package:auth_token_managment/core/utils/show_snack_bar_funnction.dart';
import 'package:auth_token_managment/core/utils/validations.dart';
import 'package:auth_token_managment/core/widgets/custom_text_form_field.dart';
import 'package:auth_token_managment/core/widgets/general_button.dart';
import 'package:auth_token_managment/core/widgets/password_field.dart';
import 'package:auth_token_managment/features/auth/data/models/login_requst_model.dart';
import 'package:auth_token_managment/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:auth_token_managment/features/auth/presentation/cubits/auth_state.dart';
import 'package:auth_token_managment/features/auth/presentation/widgets/dont_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            spacing: 16,
            children: [
              SizedBox(height: size.height * .3),
              Image.asset(AppAssets.user, width: size.width * .5),
              CustomTextFormField(
                controller: _emailController,
                hintText: 'Email',
                validator: Validations.validateEmail,
              ),
              PasswordField(
                controller: _passwordController,
                hintText: 'Password',
                validator: Validations.validatePassword,
              ),
              _buildLoginButton(),
              const DontHaveAccount(),
              SizedBox(height: size.height * .2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authState == AuthStates.sucrss) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
        if (state.authState == AuthStates.failure) {
          showSnackBarFuction(context, state.errMessage!);
        }
      },
      builder: (context, state) {
        if (state.authState == AuthStates.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return GeneralButton(onPressed: _handleLoginRequest, text: 'Login');
      },
    );
  }

  void _handleLoginRequest() {
    if (_formKey.currentState!.validate()) {
      final loginRequestModel = LoginRequestModel(
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<AuthCubit>().login(loginRequestModel: loginRequestModel);
    } else {
      setState(() => _autovalidateMode = AutovalidateMode.always);
    }
  }
}
