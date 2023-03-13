import 'package:flutter_products_store/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_products_store/domain/entities/user_entity.dart';
import 'package:flutter_products_store/domain/users/datasources/i_user_local_dao.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/infrastructure/core/process_exception.dart';
import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';

class UserRepository with ProcessException implements IUserRepository {
  IUserLocalDao local;

  UserRepository(this.local);

  @override
  Either<IFailure, UserEntity> get() {
    return processAsync<UserEntity>(doRequest: () => local.get().toDomain());
  }

  @override
  Either<IFailure, bool> isUserLoggedIn() {
    return processAsync<bool>(doRequest: () => local.isUserLoggedIn());
  }

  @override
  Either<IFailure, void> logout() {
    return processAsync<void>(doRequest: () => local.logout());
  }

  @override
  Future<Either<IFailure, void>> save(UserEntity user) {
    return process<void>(doRequest: () async {
      final userDto = UserDto.fromDomain(user);
      await local.save(userDto);
    });
  }
}
