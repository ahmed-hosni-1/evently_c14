import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String label;
  final Widget icon;
   bool isSelected;

   TabWidget({super.key,required this.icon , required this.label,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return   Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white)
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
