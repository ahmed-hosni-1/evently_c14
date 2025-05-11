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

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      ZoomIn(
                        child:
                            Center(child: Image.asset("assets/logo/logo.png")),
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
                          text: "Name",
                          controller: provider.nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Invalid Name";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(Icons.person),),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                          text: "Email",
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          controller: provider.emailController,
                          prefixIcon: Image.asset("assets/icons/email.png")),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        isPassword: true,
                        text: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Password";
                          } else if (value.length < 6) {
                            return "password must be more 6 number";
                          } else {
                            return null;
                          }
                        },
                        controller: provider.passwordController,
                        prefixIcon: Image.asset("assets/icons/lock.png"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        isPassword: true,
                        controller: provider.rePasswordController,
                        text: "Re-Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Name";
                          } else if (value !=
                              provider.passwordController.text) {
                            return "Password not matched";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Image.asset("assets/icons/lock.png"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Spacer(),
                      Center(
                        child: CustomBtn(
                            isLoading: provider.isLoading,
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                provider.createAccount(context);
                              }
                            },
                            text: "Create Account"),
                      ),
                      const Spacer(),
                      Center(
                        child: Text.rich(
                            style: theme.textTheme.bodySmall,
                            TextSpan(
                                text: "Already Have Account ?",
                                style: theme.textTheme.bodySmall,
                                children: [
                                  TextSpan(
                                    text: " Login",
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.primary,
                                        fontStyle: FontStyle.italic),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacementNamed(
                                            context, AppRoutesName.login);
                                      },
                                  ),
                                ])),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
