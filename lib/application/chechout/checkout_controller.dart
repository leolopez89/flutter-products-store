import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final IUserRepository userRepository;
  final AppState appState;

  int currentStep = 0;

  bool loading = true;
  bool isLogin = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  TextEditingController cardController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  CheckoutController({
    required this.userRepository,
    required this.appState,
  });

  @override
  void onInit() {
    super.onInit();
    loading = false;
    update();
  }

  bool get canContinueStep1 => formKey1.currentState?.validate() ?? false;
  bool get canContinueStep2 => formKey2.currentState?.validate() ?? false;

  void checkoutAndPay() {
    Get.defaultDialog(
        title: "Thanks for your order!",
        middleText: "Your product will be delivered soon.",
        barrierDismissible: false,
        actions: [
          TextButton(
              onPressed: goToHome,
              child: const Text(
                "Accept",
                style: TextStyle(color: AppColors.mainColor),
              ))
        ]);
  }

  goToHome() {
    appState.books.clear();
    appState.update();
    update();
    Get.offNamedUntil(Routes.home, ModalRoute.withName(Routes.home));
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalController.dispose();
    countryController.dispose();
    stateController.dispose();

    cardController.dispose();
    dateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  tapped(int step) {
    currentStep = step;
    update();
  }

  continued() {
    if (currentStep == 0) {
      canContinueStep1 && currentStep < 2 ? currentStep += 1 : null;
    } else if (currentStep == 1) {
      canContinueStep2 && currentStep < 2 ? currentStep += 1 : null;
    } else if (currentStep >= 2) {
      checkoutAndPay();
    }
    update();
  }

  cancel() {
    currentStep > 0 ? currentStep -= 1 : null;
    update();
  }

  void back() => Get.back();
}
