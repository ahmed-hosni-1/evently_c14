import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_c14/core/manager/app_manager.dart';
import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/services/shared_service.dart';
import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:evently_c14/core/widgets/custom_btn.dart';
import 'package:evently_c14/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                      child: Center(
                          child: Image.asset(
                    "assets/logo/logo.png",
                    width: 50,
                  ))),
                  const SizedBox(
                    width: 12,
                  ),
                  FadeInRight(
                    child: Text(
                      "Evently",
                      style: GoogleFonts.jockeyOne(
                          color: AppColors.primary, fontSize: 30),
                    ),
                  ),
                ],
              ),
              Center(child: Image.asset("assets/images/welcome_screen.png")),
              const SizedBox(
                height: 12,
              ),
              Text(
                context.tr.on_boarding_title,
                style: GoogleFonts.inter(
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(context.tr.on_boarding_des,
                  style: theme.textTheme.bodyMedium),
              const SizedBox(
                height: 12,
              ),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr.lang,
                    style: GoogleFonts.inter(
                        color: AppColors.primary, fontSize: 20),
                  ),
                  AnimatedToggleSwitch<String>.rolling(
                    current: provider.lang,
                    values: const ["en", "ar"],
                    style: const ToggleStyle(
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.primary,
                      indicatorColor: AppColors.primary,
                    ),
                    height: 40,
                    onChanged: provider.changeLanguage,
                    indicatorSize: const Size(40, 40),
                    iconList: [
                      Image.asset("assets/icons/en.png"),
                      Image.asset("assets/icons/ar.png"),
                    ],
                    // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr.theme,
                    style: GoogleFonts.inter(
                        color: AppColors.primary, fontSize: 20),
                  ),
                  AnimatedToggleSwitch<ThemeMode>.rolling(
                    current: provider.themeMode,
                    values: const [ThemeMode.light, ThemeMode.dark],
                    onChanged: provider.changeTheme,
                    style: const ToggleStyle(
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.primary,
                      indicatorColor: AppColors.primary,
                    ),
                    height: 40,
                    indicatorSize: const Size(40, 40),
                    iconList: [
                      Image.asset("assets/icons/light.png"),
                      Image.asset(
                        "assets/icons/dark.png",
                        color: provider.themeMode == ThemeMode.light
                            ? null
                            : AppColors.light,
                      ),
                    ],
                    // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: CustomBtn(
                  isLoading: provider.isLoading,
                  text: "Let’s Start",
                  onPressed: ()async {
                   await SharedService.saveBool("isFirst", false);
                    Navigator.pushReplacementNamed(
                        context, AppRoutesName.login);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
