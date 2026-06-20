import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:bootstrap_shared/bootstrap_shared.dart';
import 'package:go_router/go_router.dart';
import 'package:app_router/app_router.dart';

import '../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login failed: ${state.errorMessage.toString().replaceAll("Exception:", "")}',
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/kumpas_prop_with_text.png',
                    height: 160,
                    package: "core_package",
                  ),
                  const Gap.md(),
                  Text(
                    'Welcome Back',
                    style: context.text.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap.sm(),
                  Text(
                    'Log in to your account to continue',
                    style: context.text.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap.xxl(),
                  AppEmailField(controller: _emailController),
                  const Gap.md(),
                  AppPasswordField(controller: _passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppTextButton(
                      label: 'Forgot Password?',
                      onPressed: () =>
                          context.push(AppRoutePaths.forgotPassword),
                    ),
                  ),
                  const Gap.xl(),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return AppButton(
                        label: 'Login',
                        loading: state.status == LoginStatus.loading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              _emailController.text.trim(),
                              _passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
