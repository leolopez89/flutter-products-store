import 'package:flutter_products_store/domain/bindings/cart_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/chechout_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/details_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/home_controller_binding.dart';
import 'package:flutter_products_store/domain/bindings/login_controller_binding.dart';
import 'package:flutter_products_store/presentation/cart/cart_page.dart';
import 'package:flutter_products_store/presentation/chechout/chechout_page.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:flutter_products_store/presentation/details/details_page.dart';
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
    page: () => const HomePage(),
    binding: HomeControllerBinding(),
  ),
  GetPage(
    name: Routes.cart,
    page: () => const CartPage(),
    binding: CartControllerBinding(),
  ),
  GetPage(
    name: Routes.checkout,
    page: () => const CheckoutPage(),
    binding: CheckoutControllerBinding(),
  ),
  GetPage(
    name: Routes.productDetails,
    page: () => const DetailsPage(),
    binding: DetailsControllerBinding(),
  ),
];
