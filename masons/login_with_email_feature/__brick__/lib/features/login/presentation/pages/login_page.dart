import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid =
        _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    context.read<LoginCubit>().login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F172A),
                  Color(0xFF1E293B),
                  Color(0xFF334155),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(
                        alpha: 0.08,
                      ),
                      borderRadius:
                      BorderRadius.circular(28),
                    ),
                    child: Form(
                      key: _formKey,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.lock_outline,
                            size: 72,
                            color: Colors.white,
                          ),

                          const SizedBox(height: 32),

                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty) {
                                return 'Email is required';
                              }

                              final regex = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );

                              if (!regex.hasMatch(
                                value.trim(),
                              )) {
                                return 'Invalid email';
                              }

                              return null;
                            },
                            decoration:
                            _inputDecoration(
                              label: 'Email',
                              hint: 'example@email.com',
                              icon:
                              Icons.email_outlined,
                            ),
                          ),

                          const SizedBox(height: 20),

                          TextFormField(
                            controller:
                            _passwordController,
                            obscureText:
                            _obscurePassword,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return 'Password required';
                              }

                              if (value.length < 6) {
                                return 'Minimum 6 characters';
                              }

                              return null;
                            },
                            decoration:
                            _inputDecoration(
                              label: 'Password',
                              hint: '••••••••',
                              icon:
                              Icons.lock_outline,
                            ).copyWith(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword =
                                    !_obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons
                                      .visibility_off
                                      : Icons.visibility,
                                  color:
                                  Colors.white70,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : _submit,
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                'Login',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,

      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),

      filled: true,
      fillColor:
      Colors.white.withValues(alpha: 0.08),

      hintStyle: TextStyle(
        color: Colors.white.withValues(alpha: 0.5),
      ),

      labelStyle: const TextStyle(
        color: Colors.white70,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: Colors.white.withValues(
            alpha: 0.08,
          ),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
    );
  }
}