import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import '../cubit/forgot_password_cubit.dart';
import 'package:bootstrap_shared/bootstrap_shared.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgotPasswordCubit>(),
      child: const ForgotPasswordView(),
    );
  }
}

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password reset email sent!')),
          );
          context.pop();
        } else if (state.status == ForgotPasswordStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap.xl(),
                Text(
                  'Reset Password',
                  style: context.text.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap.md(),
                Text(
                  'Enter your email address and we\'ll send you a link to reset your password.',
                  style: context.text.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap.xxl(),
                AppEmailField(
                  controller: _emailController,
                ),
                const Gap.xl(),
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                    return AppButton(
                      label: 'Send Reset Link',
                      loading: state.status == ForgotPasswordStatus.loading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgotPasswordCubit>().sendResetEmail(
                                _emailController.text.trim(),
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
    );
  }
}
