import 'package:flutter_products_store/domain/entities/user_entity.dart';

class UserDto {
  String email;
  String password;

  UserDto({
    required this.email,
    required this.password,
  });

  UserDto.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  UserEntity toDomain() => UserEntity(
        email: email,
        password: password,
      );

  UserDto.fromDomain(UserEntity entity)
      : email = entity.email,
        password = entity.password;
}
