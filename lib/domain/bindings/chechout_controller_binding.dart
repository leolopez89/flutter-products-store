import 'package:flutter_products_store/application/chechout/checkout_controller.dart';
import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:get/get.dart';

class CheckoutControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(
        appState: Get.find<AppState>(),
        userRepository: Get.find<IUserRepository>(),
      ),
      fenix: true,
    );
  }
}
