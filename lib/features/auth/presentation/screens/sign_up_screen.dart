import 'package:flutter/material.dart';
import 'package:story_spark/core/constants/app_assets.dart';
import 'package:story_spark/core/constants/route_names.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import 'package:story_spark/core/widgets/clickable_text.dart';
import 'package:story_spark/core/widgets/gradient_button.dart';
import 'package:story_spark/data/models/user_model.dart';
import 'package:story_spark/data/services/auth_service.dart';
import 'package:story_spark/network/result_firebase.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureRepeat = true;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: AppColors.black.withValues(alpha: 0.4),
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: AppColors.black.withValues(alpha: 0.4),
        size: 20,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.inputFillColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 243, 239, 239),
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.errorRed, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.errorRed, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: AppColors.errorRed, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.pinkGradient),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  AppAssets.brandHeader,
                  width: 260,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Image.asset(
                    AppAssets.floatingFantasy,
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.88),
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.18),
                          blurRadius: 30,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Create your account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColors.black,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Begin your enchanted journey',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const _FieldLabel(label: 'Full Name'),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _fullNameController,
                            decoration: _inputDecoration(
                              hint: 'Little Explorer',
                              prefixIcon: Icons.auto_stories_rounded,
                            ),
                            validator: (v) => (v == null || v.trim().isEmpty)
                                ? 'Please enter your name'
                                : null,
                          ),
                          const SizedBox(height: 18),
                          const _FieldLabel(label: 'Email Address'),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _inputDecoration(
                              hint: 'magic@tales.com',
                              prefixIcon: Icons.mail_outline_rounded,
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(v.trim())) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          const _FieldLabel(label: 'Secret Key'),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: _inputDecoration(
                              hint: 'Your secret spell…',
                              prefixIcon: Icons.lock_outline_rounded,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.errorRed,
                                  size: 20,
                                ),
                                onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword,
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (v.length < 6) {
                                return 'Password is less than 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          const _FieldLabel(label: 'Repeat Secret Key'),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _repeatPasswordController,
                            obscureText: _obscureRepeat,
                            decoration: _inputDecoration(
                              hint: 'Repeat your spell…',
                              prefixIcon: Icons.key_rounded,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureRepeat
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.errorRed,
                                  size: 20,
                                ),
                                onPressed: () => setState(
                                  () => _obscureRepeat = !_obscureRepeat,
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Please repeat your password';
                              }
                              if (v != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          GradientButton(
                            textColor: Colors.white,
                            isLoading: _isLoading,
                            text: "Sign Up with Magic",
                            icon: const Icon(
                              Icons.rocket_launch,
                              color: Colors.white,
                              size: 22,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => _isLoading = true);
                                try {
                                  final userModel = UserModel(
                                    name: _fullNameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                  );

                                  final result = await AuthService.registerUser(
                                    userModel,
                                  );

                                  if (!mounted) return;

                                  if (result is SuccessFB) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Account created successfully! ✨",
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RouteNames.home,
                                    );
                                  } else if (result is ErrorFB) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text((result as ErrorFB).errorMessage),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("An error occurred: $e"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } finally {
                                  if (mounted) {
                                    setState(() => _isLoading = false);
                                  }
                                }
                              }
                            },
                            buttonGradient: AppColors.redPinkGradient,
                            width: 250,
                            height: 55,
                            fontSize: 22,
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ClickableText(
                              text: 'Already a member of the kingdom? ',
                              onTap: () {
                                Navigator.pushNamed(context, RouteNames.login);
                              },
                              textColor: AppColors.errorRed,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textDarkGrey,
        letterSpacing: 0.3,
      ),
    );
  }
}
