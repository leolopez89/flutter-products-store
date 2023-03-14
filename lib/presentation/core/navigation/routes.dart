import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:get/get.dart';

mixin Routes {
  static String get getInitialRoute {
    final userRepository = Get.find<IUserRepository>();
    String page = login;
    userRepository
        .isUserLoggedIn()
        .fold((l) => page = login, (r) => page = r ? home : login);
    return page;
  }

  static const String login = '/login';
  static const String home = '/home';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String success = '/success';
}
