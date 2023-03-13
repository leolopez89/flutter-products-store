import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';

abstract class IUserLocalDao {
  UserDto get();
  bool isUserLoggedIn();
  void logout();
  Future<void> save(UserDto user);
}
