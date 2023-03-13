import 'package:flutter_products_store/application/login/login_controller.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:get/get.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(userRepository: Get.find<IUserRepository>()),
      fenix: true,
    );
  }
}
