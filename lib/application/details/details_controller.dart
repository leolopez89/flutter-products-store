import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final IBookRepository bookRepository;
  final AppState appState;
  late BookEntity book;
  bool loading = true;

  DetailsController({
    required this.bookRepository,
    required this.appState,
    required Map<String, dynamic> screenArgs,
  }) {
    if (screenArgs.containsKey("book")) {
      book = screenArgs["book"] as BookEntity;
    } else {
      Get.snackbar("Error", "There is no book to show");
      Get.back();
    }
  }

  void back() => Get.back();

  void addToCart() {
    appState.books.add(book);
    appState.update();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loading = false;
    update();
  }

  goToCartPage() => Get.toNamed(Routes.cart);
}
