import 'package:animate_do/animate_do.dart';
import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/widgets/custom_btn.dart';
import 'package:evently_c14/modules/auth/provide/auth_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colros.dart';
import '../../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    ZoomIn(
                      child: Center(child: Image.asset("assets/logo/logo.png")),
                    ),
                    Center(
                      child: Text(
                        "Evently",
                        style: GoogleFonts.jockeyOne(
                            color: AppColors.primary, fontSize: 30),
                      ),
                    ),
                    const Spacer(),
                    CustomTextField(
                      controller: provider.emailController,
                        text: "Email",
                        prefixIcon: Image.asset("assets/icons/email.png")
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      controller: provider.passwordController,
                      isPassword: true,
                      text: "Password",
                      prefixIcon: Image.asset("assets/icons/lock.png"),

                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutesName.reset);
                      },
                      child: Text(
                        "Forget Password?",
                        style: theme.textTheme.bodySmall!.copyWith(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: CustomBtn(
                          isLoading: provider.isLoading,
                          onPressed: () {
                        provider.login(context);
                      }, text: "Login"),
                    ),
                    const Spacer(),
                    Center(
                      child: Text.rich(
                          style: theme.textTheme.bodySmall,
                          TextSpan(
                              text: "Don’t Have Account ?",
                              style: theme.textTheme.bodySmall,
                              children: [
                                TextSpan(
                                  text: " Create Account",
                                  style: theme.textTheme.bodySmall!.copyWith(
                                      color: AppColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                      fontStyle: FontStyle.italic),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.pushReplacementNamed(context, AppRoutesName.register);
                                  },
                                ),
                              ])),
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
