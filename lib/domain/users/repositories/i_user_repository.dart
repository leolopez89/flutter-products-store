import 'package:dartz/dartz.dart';
import 'package:flutter_products_store/domain/core/failures.dart';
import 'package:flutter_products_store/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Either<IFailure, UserEntity> get();
  Either<IFailure, bool> isUserLoggedIn();
  Either<IFailure, void> logout();
  Future<Either<IFailure, void>> save(UserEntity user);
}
