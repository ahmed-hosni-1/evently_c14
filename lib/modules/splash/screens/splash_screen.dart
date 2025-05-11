import 'package:animate_do/animate_do.dart';
import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/services/shared_service.dart';
import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          ZoomIn(
            child: Center(child: Image.asset("assets/logo/logo.png")),
            onFinish: (direction) async {

              SharedService.getBool("isFirst").then(
                (value) {
                  if (value != false) {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutesName.welcome);
                      },
                    );
                  } else {
                    if (FirebaseAuth.instance.currentUser == null) {
                      Navigator.pushReplacementNamed(
                          context, AppRoutesName.login);
                    } else {
                      Navigator.pushReplacementNamed(
                          context, AppRoutesName.layout);
                    }
                  }
                },
              );
            },
          ),
          Text(
            "Evently",
            style:
                GoogleFonts.jockeyOne(color: AppColors.primary, fontSize: 30),
          ),
          const Spacer(),
          FadeInUp(child: Image.asset("assets/logo/route_logo.png"))
        ],
      ),
    );
  }
}
