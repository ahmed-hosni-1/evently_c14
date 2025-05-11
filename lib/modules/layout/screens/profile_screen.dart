import 'package:evently_c14/core/manager/app_manager.dart';
import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:evently_c14/main.dart';
import 'package:evently_c14/modules/layout/manager/layout_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayoutProvider>(context);
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(bottom: 20, left: 8, right: 8, top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: appProvider.lang != "ar"
                        ? const Radius.circular(90)
                        : const Radius.circular(0),
                    bottomRight: appProvider.lang == "ar"
                        ? const Radius.circular(90)
                        : const Radius.circular(0)),
                color: AppColors.primary),
            child: SafeArea(
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: appProvider.lang == "ar"
                            ? const Radius.circular(360)
                            : const Radius.circular(24),
                        topRight: appProvider.lang != "ar"
                            ? const Radius.circular(360)
                            : const Radius.circular(24),
                        bottomRight: const Radius.circular(360),
                        bottomLeft: const Radius.circular(360),
                      ),
                      child: Image.asset(
                        "assets/logo/route.jpg",
                        width: 160,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.user.displayName?.toUpperCase() ?? "",
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                provider.user.email ?? "",
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(context.tr.lang),
          Container(
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary)),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(16),
              underline: const SizedBox(),
              value: appProvider.lang,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: "ar",
                  child: Text(
                    "Arabic",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
                DropdownMenuItem(
                  value: "en",
                  child: Text(
                    "English",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  appProvider.changeLanguage(value);
                }
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(context.tr.theme),
          Container(
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary)),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(16),
              underline: const SizedBox(),
              value: appProvider.themeMode,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text(
                    "Light",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text(
                    "Dark",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  appProvider.changeTheme(value);
                }
              },
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, AppRoutesName.login);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Text(
                      "Logout",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
