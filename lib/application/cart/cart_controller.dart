import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final AppState appState;
  bool loading = true;

  CartController({
    required this.appState,
  });

  void removeFromCart(BookEntity book) {
    appState.books.remove(book);
    appState.update();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loading = false;
    update();
  }

  goToCheckoutPage() => Get.toNamed(Routes.checkout);
}
