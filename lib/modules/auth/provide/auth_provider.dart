import 'package:evently_c14/core/routes/app_routes_name.dart';
import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:evently_c14/core/widgets/custom_toast.dart';
import 'package:evently_c14/modules/auth/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isLoading = false;

  Future<void> createAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      await FireBaseService.createAccount(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text);
    } catch (e) {
      CustomToast.show(
          context: context, text: e.toString(), type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      var user = await FireBaseService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (user?.user != null) {
        Navigator.pushReplacementNamed(context, AppRoutesName.layout);
        CustomToast.show(
            context: context,
            text: "Welcome , ${user?.user?.displayName ?? ""} ",
            type: ToastType.success);
      }
    } catch (e) {
      CustomToast.show(
          context: context, text: e.toString(), type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }


  Future<void> resetPassword(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
   await FireBaseService.resetPassword(
        emailController.text,
      );
   CustomToast.show(
       context: context,
       text: "Check your Email",
       type: ToastType.success);
    } catch (e) {
      CustomToast.show(
          context: context, text: e.toString(), type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }

}
