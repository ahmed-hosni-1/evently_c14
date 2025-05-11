import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  final String label;
  final Widget icon;
   bool isSelected;

   TabEventWidget({super.key,required this.icon , required this.label,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return   Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary)
        ),
        child:  Row(
          children: [
            icon,
            const SizedBox(
              width: 4,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
