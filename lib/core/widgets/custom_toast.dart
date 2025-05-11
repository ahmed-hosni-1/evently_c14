import 'package:flutter/material.dart';

import '../theme/app_colros.dart';

class CustomToast{
  static void show({required BuildContext context , required String text , ToastType type  = ToastType.success }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: type == ToastType.success?  AppColors.primary : type == ToastType.error? Colors.red : Colors.yellow,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Text(text,
        style: const TextStyle(
            fontSize: 16
        ),
      ),
    ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      showCloseIcon: true,
      closeIconColor: Colors.red,

    ),);
  }
}

enum ToastType{
  error, success , warning
}