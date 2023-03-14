import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/core/validators.dart';
import 'package:flutter_products_store/domain/entities/user_entity.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final IUserRepository userRepository;

  bool loading = true;
  bool isLogin = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  LoginController({required this.userRepository});

  @override
  void onInit() {
    super.onInit();
    loading = false;
    update();
  }

  Future<bool> login() async {
    loading = true;
    update();

    if (!(formKey.currentState?.validate() ?? false)) {
      loading = false;
      update();
      return false;
    }

    final newUser = UserEntity(
        email: emailController.text, password: passwordController.text);
    final result = await userRepository.save(newUser);
    result.fold((l) => null, (r) => Get.offAllNamed(Routes.home));

    loading = false;
    update();

    return true;
  }

  switchLoginRegister() {
    isLogin = !isLogin;
    update();
  }

  forgotPassword() {
    if (emailController.text.isEmail) {
      Get.snackbar("Don't worry", "Instructions have been sent to your email!");
    } else {
      Get.snackbar("Error", "Please write a valid email!");
    }
  }

  String? passwordValidator(String? value) =>
      nameValidator(value) ??
      (isLogin
          ? null
          : (passwordController.text != repeatPassController.text
              ? "Password must match"
              : null));

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPassController.dispose();
    super.dispose();
  }
}
