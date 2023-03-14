import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final IBookRepository bookRepository;
  final IUserRepository userRepository;
  final AppState appState;

  bool loading = true;
  SortingMode sorting = SortingMode.relevance;

  List<BookEntity> books = [];
  List<BookEntity> sorted = [];
  List<BookEntity> get booksList =>
      sorting == SortingMode.relevance ? books : sorted;

  HomeController({
    required this.bookRepository,
    required this.userRepository,
    required this.appState,
  });

  @override
  void onInit() {
    super.onInit();
    loading = false;
    update();
  }

  Future<void> getBooks() async {
    loading = true;
    update();

    final results = await bookRepository.list();
    results.fold((error) {
      books = [];
      Get.snackbar("Error", error.message.body);
      loading = false;
      update();
    }, (results) {
      loading = false;
      update();
      books = results;
    });
  }

  void switchSort() {
    if (sorting == SortingMode.price) {
      sorting = SortingMode.relevance;
    } else {
      sorting = SortingMode.price;
      sorted.clear();
      sorted.addAll(books);
      sorted.sort((a, b) => (a.saleInfo?.listPrice?.amount ?? 0)
          .compareTo(b.saleInfo?.listPrice?.amount ?? 0));
    }
    update();
  }

  void addToCart(int index) {
    appState.books.add(booksList[index]);
    appState.update();
    update();
  }

  goToDetails(int index) =>
      Get.toNamed(Routes.productDetails, arguments: {"book": booksList[index]});

  goToCartPage() => Get.toNamed(Routes.cart);

  logout() {
    userRepository.logout().fold(
          (l) => Get.snackbar("Error", l.message.body),
          (r) => Get.offAllNamed(Routes.login),
        );
  }
}

enum SortingMode {
  relevance,
  price,
}
