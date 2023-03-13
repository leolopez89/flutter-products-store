import 'package:flutter_products_store/application/cart/cart_controller.dart';
import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:get/get.dart';

class CartControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(appState: Get.find<AppState>()),
      fenix: true,
    );
  }
}
