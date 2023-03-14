import 'package:flutter_products_store/domain/bindings/cart_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/chechout_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/details_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/home_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/login_controller_binding.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:flutter_products_store/presentation/home/home_page.dart';
import 'package:flutter_products_store/presentation/login/login_page.dart';
import 'package:get/get.dart';

List<GetPage> appRoutes = [
  GetPage(
    name: Routes.login,
    page: () => const LoginPage(),
    binding: LoginControllerBinding(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomePage(), //HomePage(),
    binding: HomeControllerBinding(),
  ),
  GetPage(
    name: Routes.cart,
    page: () => const LoginPage(), //CartPage(),
    binding: CartControllerBinding(),
  ),
  GetPage(
    name: Routes.checkout,
    page: () => const LoginPage(), //CheckoutPage(),
    binding: CheckoutControllerBinding(),
  ),
  GetPage(
    name: Routes.productDetails,
    page: () => const LoginPage(), //DetailsPage(),
    binding: DetailsControllerBinding(),
  ),
];
