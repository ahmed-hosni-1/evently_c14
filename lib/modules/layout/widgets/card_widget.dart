import 'package:evently_c14/core/models/event_model.dart';
import 'package:evently_c14/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colros.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.theme,
    required this.event,
  });

  final ThemeData theme;
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayoutProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image:  DecorationImage(
              image: AssetImage(event.categoryImage),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.primaryColorLight,
            ),
            child: Column(
              children: [
                Text(
                  DateFormat.MMM().format(event.eventDate),
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  event.eventDate.day.toString(),
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.primaryColorLight,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: theme.textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    provider.toggleFav(event);
                  },
                  child:  Icon(
                    event.isFav ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
