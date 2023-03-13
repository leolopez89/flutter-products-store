import 'dart:convert';

import 'package:flutter_products_store/domain/users/datasources/i_user_local_dao.dart';
import 'package:flutter_products_store/infrastructure/core/constants.dart';
import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';
import 'package:get_storage/get_storage.dart';

class UserLocalDao implements IUserLocalDao {
  final GetStorage storage;

  UserLocalDao(this.storage);

  @override
  UserDto get() {
    final userJson = storage.read<String>(StorageKeys.loggedUser) ?? "";
    final userMap = jsonDecode(userJson);
    return UserDto.fromJson(userMap);
  }

  @override
  bool isUserLoggedIn() {
    final userJson = storage.read<String>(StorageKeys.loggedUser) ?? "";
    return userJson.isNotEmpty;
  }

  @override
  void logout() => storage.write(StorageKeys.loggedUser, "");

  @override
  Future<void> save(UserDto user) async {
    String userJson = jsonEncode(user.toJson());
    await storage.write(StorageKeys.loggedUser, userJson);
  }
}
