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

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    ZoomIn(
                      child: Center(child: Image.asset("assets/images/change-setting.png")),
                    ),
                    const Spacer(),
                    CustomTextField(
                      controller: provider.emailController,
                        text: "Email",
                        prefixIcon: Image.asset("assets/icons/email.png")
                    ),
                    const Spacer(),
                    CustomBtn(
                        isLoading: provider.isLoading,
                        onPressed: () {
                      provider.resetPassword(context);
                    }, text: "Reset Password"),
                    const Spacer(flex: 3,),
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
