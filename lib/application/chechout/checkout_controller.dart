import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final IUserRepository userRepository;
  final AppState appState;

  bool loading = true;
  bool isLogin = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  CheckoutController({
    required this.userRepository,
    required this.appState,
  });

  @override
  void onInit() {
    super.onInit();
    loading = false;
    emailController.addListener(validateFields);
    nameController.addListener(validateFields);
    addressController.addListener(validateFields);
    cityController.addListener(validateFields);
    postalController.addListener(validateFields);
    countryController.addListener(validateFields);
    stateController.addListener(validateFields);
    update();
  }

  Future<bool> checkoutAndPay() async {
    loading = true;
    update();

    if (!(formKey.currentState?.validate() ?? false)) {
      loading = false;
      update();
      return false;
    }

    //ShowSuccess
    loading = false;
    update();

    return true;
  }

  goToHome() {
    Get.offNamedUntil(Routes.home, ModalRoute.withName(Routes.home));
    update();
  }

  bool validateFields() =>
      emailController.text.isEmail &&
      nameController.text.isNotEmpty &&
      addressController.text.isNotEmpty &&
      cityController.text.isNotEmpty &&
      postalController.text.isNotEmpty &&
      countryController.text.isNotEmpty &&
      stateController.text.isNotEmpty;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalController.dispose();
    countryController.dispose();
    stateController.dispose();
    super.dispose();
  }
}
