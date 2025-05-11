import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:evently_c14/modules/layout/manager/layout_provider.dart';
import 'package:evently_c14/modules/layout/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider()..getEvents(),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.addEvent).then(
                  (value) {
                    provider.getEvents();
                  },
                );
              },
              elevation: 0,
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                  side: const BorderSide(color: Colors.white, width: 3)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 36,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.selectedIndex,
              onTap: provider.onBtnNavTap,
              backgroundColor: AppColors.primary,
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home_filled),
                    icon: Icon(Icons.home_outlined),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on_outlined),
                    activeIcon: Icon(Icons.location_on_rounded),
                    label: "Map"),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.favorite),
                    icon: Icon(Icons.favorite_border_rounded),
                    label: "Love"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined),
                    activeIcon: Icon(Icons.person),
                    label: "Profile"),
              ],
            ),
            body: provider.screens[provider.selectedIndex],
          );
        },
      ),
    );
  }
}
