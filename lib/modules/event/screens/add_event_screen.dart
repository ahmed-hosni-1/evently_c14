import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:evently_c14/core/widgets/custom_btn.dart';
import 'package:evently_c14/core/widgets/custom_text_field.dart';
import 'package:evently_c14/modules/event/manager/event_provider.dart';
import 'package:evently_c14/modules/event/widgets/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_category.dart';
import '../../layout/widgets/tab_widget.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Consumer<EventProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            bottomSheet: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 50,
                  child: CustomBtn(
                      isLoading: provider.isLoading,
                      onPressed: () async {
                        await provider.addEvent();
                        Navigator.pop(context);
                      },
                      text: "Add Event")),
            ),
            appBar: AppBar(
              centerTitle: true,
              iconTheme: const IconThemeData(color: AppColors.primary),
              title: const Text(
                "Add Event",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AppCategory.categories[provider.selectedIndex].image,
                          height: 220,
                          gaplessPlayback: true,
                          fit: BoxFit.cover,
                        )),
                    DefaultTabController(
                      length: AppCategory.categories.length,
                      initialIndex: provider.selectedIndex,
                      child: TabBar(
                          onTap: provider.onTap,
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: const EdgeInsets.all(4),
                          labelColor: Colors.white,
                          unselectedLabelColor: AppColors.primary,
                          tabs: AppCategory.categories.map(
                            (e) {
                              return TabEventWidget(
                                  icon: e.icon,
                                  label: e.name,
                                  isSelected:
                                      AppCategory.categories.indexOf(e) ==
                                          provider.selectedIndex);
                            },
                          ).toList()),
                    ),
                    Text(
                      "Title",
                      style: theme.textTheme.bodySmall,
                    ),
                    CustomTextField(
                      controller: provider.titleController,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Desc",
                      style: theme.textTheme.bodySmall,
                    ),
                    CustomTextField(
                      controller: provider.descController,
                      hight: 130,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.date_range_sharp),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Event Date",
                          style: theme.textTheme.bodySmall,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                currentDate: provider.eventDate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 365),
                                ),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    provider.onSelectDate(value);
                                  }
                                },
                              );
                            },
                            child: Text(
                              provider.eventDate != null
                                  ? DateFormat.yMd().format(provider.eventDate!)
                                  : "Select Date",
                              style: theme.textTheme.bodySmall,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.timelapse),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Event Time",
                          style: theme.textTheme.bodySmall,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then(
                              (value) {
                                if (value != null) {
                                  provider.onSelectedTime(value);
                                }
                              },
                            );
                          },
                          child: Text(
                            provider.eventTime != null
                                ? provider.eventTime!.format(context)
                                : "Select Time",
                            style: theme.textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
