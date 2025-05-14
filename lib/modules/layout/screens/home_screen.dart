import 'package:evently_c14/core/constant/app_category.dart';
import 'package:evently_c14/core/manager/app_manager.dart';
import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:evently_c14/modules/layout/manager/layout_provider.dart';
import 'package:evently_c14/modules/layout/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayoutProvider>(context);
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            provider.user.displayName?.toUpperCase() ?? "",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      appProvider.themeMode == ThemeMode.light
                          ? Image.asset("assets/icons/light.png")
                          : Image.asset(
                              "assets/icons/dark.png",
                              color: Colors.white,
                            ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(appProvider.lang.toUpperCase(),
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: AppColors.primary)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text("Cairo , Egypt",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.white)),
                    ],
                  ),
                  DefaultTabController(
                    length: AppCategory.categories.length + 1,
                    initialIndex: provider.tabIndex,
                    child: TabBar(
                        onTap: provider.onChangeTab,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.all(4),
                        labelColor: AppColors.primary,
                        unselectedLabelColor: Colors.white,
                        tabs: [
                          TabWidget(
                              icon: Icon(Icons.public),
                              label: "All",
                              isSelected: provider.tabIndex == 0),
                          ...AppCategory.categories.map(
                            (e) {
                              return TabWidget(
                                  icon: e.icon,
                                  label: e.name,
                                  isSelected:
                                      AppCategory.categories.indexOf(e) ==
                                          provider.tabIndex - 1);
                            },
                          ).toList()
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return provider.getEvents();
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(4),
                itemCount: provider.events.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemBuilder: (context, index) {
                  return CardWidget(
                      theme: theme, event: provider.events[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
