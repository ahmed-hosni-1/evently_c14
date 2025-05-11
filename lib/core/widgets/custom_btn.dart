import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colros.dart';

class CustomBtn extends StatelessWidget {
 final bool isLoading;
  final void Function() onPressed;
  final String text;

  const CustomBtn({super.key,required this.onPressed , required this.text ,this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isLoading ? null : onPressed,
      color: AppColors.primary,
      disabledColor: AppColors.primary.withOpacity(0.5),
      child: AnimatedCrossFade(firstChild:  SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
          secondChild: const CupertinoActivityIndicator(color: AppColors.light,),
          crossFadeState:isLoading? CrossFadeState.showSecond: CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500)),
    );
  }
}
